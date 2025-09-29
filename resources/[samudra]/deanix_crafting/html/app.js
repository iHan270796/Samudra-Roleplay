let selectedItem = null;
let selectedAmount = 1;
let craftingQueue = [];
let craftingHistory = [];
let isCraftingDone = false;
let currentStep = 0;
let expectedKey = '';
let miniGameFailed = 0;
let animation;
let lastCraftedItem = null;
let keyPressedThisStep = false;
let currentXP = 0;
let level = 0;
let craftingInterval = null;
let isUIOpen = false;
let isCraftingInProgress = false;
let playerItems = {};

const debugMode = false;
const maxStep = 3;
const miniGameContainer = document.getElementById('mini-game');
const miniBarProgress = document.getElementById('mini-bar-progress');
const miniBarZone = document.querySelector('.mini-bar-zone');
const miniKey = document.getElementById('mini-key');
const miniFeedback = document.getElementById('mini-feedback');

window.addEventListener('message', async function (event) {
	isUIOpen = true;

	if (event.data.action === 'openCraftingUI') {
		document.getElementById('layout1').style.display = 'flex';
		document.getElementById('layout2').style.display = 'none';
		document.getElementById('layout3').style.display = 'none';
		playerItems = event.data.playerItems || {};
		await updateXPDisplay();
		loadCraftingList(event.data.items);
	}
});

document.getElementById('continue-crafting').addEventListener('click', () => {
	if (!selectedItem) return;

	if ((selectedItem.level || 1) > level + 1) {
		fetch(`https://${GetParentResourceName()}/notify`, {
			method: 'POST',
			headers: { 'Content-Type': 'application/json' },
			body: JSON.stringify({
				type: 'error',
				message: `Level tidak cukup! Diperlukan level ${
					selectedItem.level
				}, kamu level ${level + 1}`,
			}),
		});
		return;
	}

	const btn = document.getElementById('continue-crafting');
	btn.disabled = true;
	btn.innerText = 'Memeriksa...';

	updateXPDisplay();

	fetch(`https://${GetParentResourceName()}/checkRequirements`, {
		method: 'POST',
		headers: { 'Content-Type': 'application/json' },
		body: JSON.stringify({ item: selectedItem, amount: selectedAmount }),
	})
		.then((res) => res.json())
		.then((data) => {
			if (data.success) {
				document.getElementById('layout3').style.display = 'flex';
				document.getElementById('confirm-item').innerHTML = `
                <p><img src="nui://ox_inventory/web/images/${selectedItem.item}.png" width="48"><br>${selectedItem.label}</p>
            `;
			} else {
				fetch(`https://${GetParentResourceName()}/notify`, {
					method: 'POST',
					headers: { 'Content-Type': 'application/json' },
					body: JSON.stringify({
						type: 'error',
						message: 'Bahan tidak cukup.',
					}),
				});
			}
		})
		.finally(() => {
			btn.disabled = false;
			btn.innerText = 'Lanjut Crafting';
		});
});

function getMaxCraftableAmount(item, playerItems) {
	if (item && typeof item.maxCraftable === 'number') {
		return item.maxCraftable;
	}

	let maxAmount = Infinity;
	item.requirements.forEach((req) => {
		const invItem = playerItems.find((i) => i.name === req.item);
		const amount = invItem ? invItem.amount : 0;
		maxAmount = Math.min(maxAmount, Math.floor(amount / req.amount));
	});

	return maxAmount;
}

function updateAmountButtons() {
	const max = getMaxCraftableAmount(selectedItem, playerItems);
	// console.log('Max craftable amount:', max, 'Selected amount:', selectedAmount);
	const plusBtn = document.getElementById('plus');
	const minusBtn = document.getElementById('minus');

	plusBtn.disabled = selectedAmount >= max;
	minusBtn.disabled = selectedAmount <= 1;
}

function loadCraftingList(items) {
	const list = document.getElementById('item-list');
	list.innerHTML = '';
	items.forEach((item) => {
		const requiredLevel = item.level || 1;
		const isLocked = requiredLevel > level;
		// console.log(
		// 	`Item: ${item.label}, Required Level: ${requiredLevel}, Player Level: ${level}, Is Locked: ${isLocked}`
		// );

		const div = document.createElement('div');
		div.classList.add('craft-item');
		if (isLocked) {
			div.classList.add('locked-item');
		}

		div.innerHTML = `
            <div class="craft-item-inner" ${
							isLocked
								? `title="Level belum cukup (Perlu level ${requiredLevel})"`
								: ''
						}>
                <img src="nui://ox_inventory/web/images/${
									item.item
								}.png" width="32">
                <div class="craft-item-info">
                    <span class="craft-item-label">${item.label}</span><br>
                    <span class="craft-item-level">Level ${requiredLevel}</span>
                </div>
            </div>
        `;

		div.onclick = () => {
			if (isLocked) return;

			document.querySelectorAll('.craft-item').forEach((el) => {
				el.classList.remove('selected');
			});

			div.classList.add('selected');

			selectedItem = item;
			selectedAmount = 1;

			fetch(`https://${GetParentResourceName()}/getMaxCraftAmount`, {
				method: 'POST',
				headers: { 'Content-Type': 'application/json' },
				body: JSON.stringify({ item: selectedItem }),
			})
				.then((res) => res.json())
				.then((data) => {
					const max = data.max || 1;
					// console.log('Max craftable from server:', max);

					selectedItem.maxCraftable = max;

					updateAmountButtons();
					document.getElementById('craft-amount').innerText = selectedAmount;
					document.getElementById('xp-gain-preview').innerText = `+${
						(item.xp_gain || 10) * selectedAmount
					} XP`;
				});

			document.getElementById('layout2').style.display = 'flex';
			document.getElementById('layout3').style.display = 'none';

			document.getElementById('selected-item').innerHTML = `
                <div class="selected-main-item">
                    <img src="nui://ox_inventory/web/images/${
											item.item
										}.png" width="64">
                    <h4>${item.label}</h4>
                </div>
                <div class="selected-requirements">
                    ${item.requirements
											.map(
												(req) => `
                        <div class="requirement-item">
                            <img src="nui://ox_inventory/web/images/${req.item}.png" width="32">
                            <span>${req.amount}x ${req.item}</span>
                        </div>
                    `
											)
											.join('')}
                </div>
            `;

			item.level = item.level || 1;
			item.xp = item.xp || 0;
			item.next_xp = item.next_xp || 100;

			updateHistory();
			updateItemXPDisplay(item);
		};

		list.appendChild(div);
	});
}

document.getElementById('plus').addEventListener('click', () => {
	const max = getMaxCraftableAmount(selectedItem, playerItems);
	if (selectedAmount < max) {
		selectedAmount++;
		document.getElementById('craft-amount').innerText = selectedAmount;
		document.getElementById('xp-gain-preview').innerText = `+${
			(selectedItem.xp_gain || 10) * selectedAmount
		} XP`;
		updateAmountButtons();
	}
});

document.getElementById('minus').addEventListener('click', () => {
	if (selectedAmount > 1) {
		selectedAmount--;
		document.getElementById('craft-amount').innerText = selectedAmount;
		document.getElementById('xp-gain-preview').innerText = `+${
			(selectedItem.xp_gain || 10) * selectedAmount
		} XP`;
		updateAmountButtons();
	}
});

document.getElementById('start-crafting').addEventListener('click', () => {
	if (!selectedItem || isCraftingInProgress) return;

	isCraftingInProgress = true;
	const startBtn = document.getElementById('start-crafting');
	startBtn.disabled = true;
	startBtn.innerText = 'Sedang crafting...';

	const entry = {
		item: selectedItem.item,
		label: selectedItem.label,
		amount: selectedAmount,
		requirements: selectedItem.requirements,
		progress: 0,
		xp_gain: selectedItem.xp_gain || 10,
	};

	craftingQueue = [entry];
	updateQueue();
	simulateCrafting(entry);

	fetch(`https://${GetParentResourceName()}/startPlayerAnim`, {
		method: 'POST',
	});
});

function updateQueue() {
	const queue = document.getElementById('queue-list');
	queue.innerHTML = '';
	craftingQueue.forEach((entry) => {
		const div = document.createElement('div');
		div.innerHTML = `
            <p>
                ${entry.amount}x <img src="nui:/ox_inventory/web/images/${entry.item}.png" width="24"> ${entry.label}
                <br><progress value="${entry.progress}" max="100"></progress>
            </p>
        `;
		queue.appendChild(div);
	});
}

function simulateCrafting(entry) {
	craftingInterval = setInterval(() => {
		entry.progress += 5;
		updateQueue();

		if (entry.progress >= 100) {
			clearInterval(craftingInterval);
			entry.progress = 100;
			isCraftingDone = true;
			updateQueue();

			if (isUIOpen) {
				showMiniGame(entry);
			} else if (debugMode) {
				// console.log('Crafting selesai, tapi UI sudah ditutup.');
			}
		}
	}, 200);
}

function showMiniGame(entry) {
	document.getElementById('layout3').style.display = 'flex';
	document.getElementById('confirm-item').innerHTML = '';
	document.getElementById('craft-result').innerHTML = '';

	currentStep = 0;
	miniGameFailed = 0;
	keyPressedThisStep = false;
	miniGameContainer.style.display = 'block';

	nextMiniGameStep(entry);
}

function nextMiniGameStep(entry) {
	if (!isUIOpen || !selectedItem || !selectedItem.item) {
		// console.warn(
		// 	'UI tidak aktif atau selectedItem kosong, hentikan minigame step.'
		// );
		return;
	}

	if (currentStep >= maxStep) {
		miniGameContainer.style.display = 'none';

		if (miniGameFailed < 2) {
			document.getElementById('craft-result').innerHTML = `
                <p><img src="nui://ox_inventory/web/images/${entry.item}.png" width="48"><br>${entry.amount}x ${entry.label}</p>
            `;
			lastCraftedItem = { ...entry };
			$.post(
				`https://${GetParentResourceName()}/craftSuccess`,
				JSON.stringify(entry)
			);

			updateXPDisplay(entry.item);
		} else {
			miniFeedback.innerText = 'Crafting gagal!';

			if (!selectedItem || !selectedItem.item) {
				// console.error(
				// 	'selectedItem kosong atau tidak valid saat gagal crafting:',
				// 	selectedItem
				// );
				return;
			}

			$.post(
				`https://${GetParentResourceName()}/failCrafting`,
				JSON.stringify({
					item: selectedItem.item,
					amount: selectedAmount,
				})
			);
		}
		return;
	}

	expectedKey = ['W', 'A', 'S', 'D'][Math.floor(Math.random() * 4)];
	miniKey.innerText = expectedKey;
	miniFeedback.innerText = '';
	miniBarProgress.style.left = '0%';

	let start = null;
	function animate(timestamp) {
		if (!start) start = timestamp;
		const progress = timestamp - start;
		const percent = (progress / 1500) * 100;

		if (percent <= 100) {
			miniBarProgress.style.left = `${percent}%`;
			animation = requestAnimationFrame(animate);
		} else {
			cancelAnimationFrame(animation);
			miniFeedback.innerText = 'Terlambat!';
			currentStep++;
			miniGameFailed++;
			nextMiniGameStep(entry);
		}
	}

	animation = requestAnimationFrame(animate);
}

document.addEventListener('keydown', (e) => {
	if (miniGameContainer.style.display === 'none') return;
	if (!expectedKey || keyPressedThisStep) return;

	const key = e.key.toUpperCase();
	if (!['W', 'A', 'S', 'D'].includes(key)) return;

	keyPressedThisStep = true;

	const progressRect = miniBarProgress.getBoundingClientRect();
	const zoneRect = miniBarZone.getBoundingClientRect();
	const center = progressRect.left + progressRect.width / 2;
	const inZone = center >= zoneRect.left && center <= zoneRect.right;

	cancelAnimationFrame(animation);

	if (key === expectedKey && inZone) {
		miniFeedback.innerText = 'Sukses!';
	} else {
		miniFeedback.innerText = `Gagal! (tekan ${expectedKey})`;
		miniGameFailed++;
	}

	currentStep++;
	expectedKey = '';

	setTimeout(() => {
		keyPressedThisStep = false;
		nextMiniGameStep(craftingQueue[craftingQueue.length - 1]);
	}, 800);
});

document.getElementById('take-item').addEventListener('click', () => {
	if (!lastCraftedItem || !isCraftingDone) return;

	$.post(
		`https://${GetParentResourceName()}/craftItem`,
		JSON.stringify(lastCraftedItem)
	);
	craftingHistory.push({ ...lastCraftedItem });

	fetch(`https://${GetParentResourceName()}/stopPlayerAnim`, {
		method: 'POST',
	});

	document.getElementById('layout3').style.display = 'none';
	resetState();
	updateHistory();

	isCraftingDone = false;
	document.getElementById('craft-result').innerHTML = '';

	const startBtn = document.getElementById('start-crafting');
	startBtn.disabled = false;
	startBtn.innerText = 'Mulai Crafting';

	isCraftingInProgress = false;
});

function resetState() {
	selectedItem = null;
	selectedAmount = 1;
	isCraftingDone = false;
	lastCraftedItem = null;

	if (animation) cancelAnimationFrame(animation);
	if (craftingInterval) clearInterval(craftingInterval);

	animation = null;
	craftingInterval = null;

	document.getElementById('layout3').style.display = 'none';
}

function updateHistory() {
	const history = document.getElementById('history-list');
	history.innerHTML = '';
	craftingHistory.forEach((entry) => {
		const div = document.createElement('div');
		div.innerHTML = `${entry.amount}x <img src="nui://ox_inventory/web/images/${entry.item}.png" width="20"> ${entry.label}`;
		history.appendChild(div);
	});
}

async function updateXPDisplay() {
	const response = await fetch(
		`https://${GetParentResourceName()}/getExpAndLevel`,
		{
			method: 'POST',
			headers: { 'Content-Type': 'application/json' },
			body: JSON.stringify(),
		}
	);

	const data = await response.json();

	if (data) {
		level = data.level || 0;
		const maxXp = data.maxXp;
		const xp = data.xp;
		const progressPercent = Math.min((xp / maxXp) * 100, 100);
		document.getElementById('item-level').innerText = `Level ${data.level}`;
		document.getElementById(
			'item-xp-text'
		).innerText = `${data.xp} / ${data.maxXp} XP`;
		document.getElementById('item-xp-bar').style.width = `${progressPercent}%`;
	}
}

function addXPToSelectedItem(amount) {
	if (!selectedItem) return;

	selectedItem.xp = (selectedItem.xp || 0) + amount;

	if (selectedItem.xp >= selectedItem.next_xp) {
		selectedItem.level = (selectedItem.level || 1) + 1;
		selectedItem.xp = 0;
		selectedItem.next_xp = (selectedItem.next_xp || 100) + 50;
	}

	updateItemXPDisplay(selectedItem);

	$.post(
		`https://${GetParentResourceName()}/updateItemXP`,
		JSON.stringify({
			item: selectedItem.item,
			xp: selectedItem.xp,
			level: selectedItem.level,
			next_xp: selectedItem.next_xp,
		})
	);
}

function updateItemXPDisplay(item) {
	const levelSpan = document.getElementById('item-level');
	const xpTextSpan = document.getElementById('item-xp-text');
	const xpBarFill = document.getElementById('item-xp-bar');

	if (!item || item.level == null || item.xp == null || item.next_xp == null) {
		levelSpan.innerText = 'Level ?';
		xpTextSpan.innerText = '??? XP';
		xpBarFill.style.width = '0%';
		return;
	}

	levelSpan.innerText = `Level ${item.level}`;
	xpTextSpan.innerText = `${item.xp} / ${item.next_xp} XP`;
	const progress = (item.xp / item.next_xp) * 100;
	xpBarFill.style.width = `${progress}%`;
}

document.addEventListener('keydown', function (event) {
	if (event.key === 'Escape') {
		closeCraftingUI();
	}
});

function closeCraftingUI() {
	isUIOpen = false;
	document.getElementById('layout1').style.display = 'none';
	document.getElementById('layout2').style.display = 'none';
	document.getElementById('layout3').style.display = 'none';

	if (animation) cancelAnimationFrame(animation);
	if (craftingInterval) clearInterval(craftingInterval);
	miniGameContainer.style.display = 'none';
	expectedKey = '';
	keyPressedThisStep = false;
	craftingQueue = [];
	isCraftingDone = false;
	selectedItem = null;
	selectedAmount = 1;
	lastCraftedItem = null;

	fetch(`https://${GetParentResourceName()}/stopPlayerAnim`, {
		method: 'POST',
	});

	document.getElementById('queue-list').innerHTML = '';
	document.getElementById('craft-result').innerHTML = '';
	document.getElementById('confirm-item').innerHTML = '';

	const startBtn = document.getElementById('start-crafting');
	startBtn.disabled = false;
	startBtn.innerText = 'Mulai Crafting';
	isCraftingInProgress = false;

	fetch(`https://${GetParentResourceName()}/closeCraftingUI`, {
		method: 'POST',
	});
}
