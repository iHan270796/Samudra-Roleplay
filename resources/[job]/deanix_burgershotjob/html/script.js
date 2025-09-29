let selectedMakanan = null;
let bahanTroli = {};
let troliItems = [];
let playerName = "Player";
let semuaBahan = {};
let isCustomerMode = false;

window.addEventListener("DOMContentLoaded", () => {
    document.getElementById("btnBayar").addEventListener("click", handleBayar);
    document.getElementById("btnTambahTroli").addEventListener("click", handleTambahTroli);
});

window.addEventListener("message", function (event) {
    const data = event.data;

    if (data.action === "openUI") {
    isCustomerMode = false;

    document.getElementById("layout1").style.display = "flex";
    document.getElementById("layout2").style.display = "none";
    document.getElementById("historySection").style.display = "block";
    document.getElementById("historySectionCustomer").style.display = "none";

    const makananList = data.makananList;
    const historyList = data.history || [];
        renderMakananList(makananList);
        renderHistory(historyList);
    }

    if (data.action === "openCustomerKatalog") {
    isCustomerMode = true;

    document.getElementById("layout1").style.display = "flex";
    document.getElementById("layout2").style.display = "none";
    document.getElementById("historySection").style.display = "none";
    document.getElementById("historySectionCustomer").style.display = "block";

    const historyList = document.getElementById("historyListCustomer");
    if (historyList) {
        historyList.innerHTML = "";
        if (Array.isArray(data.history)) {
            data.history.forEach(item => {
                const div = document.createElement("div");
                div.className = "history-item";
                div.innerHTML = `
                    <div style="display: flex; flex-direction: column;">
                        <strong>${item.itemName}</strong> x${item.qty}
                        <span style="font-size: 12px; color: gray;">oleh ${item.name}</span>
                    </div>
                `;
                historyList.appendChild(div);
            });
        }
    }

    fetch(`https://${GetParentResourceName()}/getCustomerMenu`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: "{}"
    })
    .then(res => res.json())
    .then(data => {
        if (data.makananList) {
            renderMakananList(data.makananList, true);
        }
    });
}

    if (data.action === "queueDone") {
        playerName = data.playerName || playerName;
        const queueItem = document.getElementById("queueItem");
        const queueBar = document.getElementById("queueBar");
        if (queueItem && queueBar) {
            queueItem.innerText = "Selesai!";
            queueBar.style.display = "none";
        }

        setBayarEnabled(true);
    
        if (data.history && Array.isArray(data.history)) {
            data.history.forEach(item => {
                addToHistory(item.itemName, item.qty, item.name);
            });
        }
    }

    if (data.action === "queueDoneCustomer") {
    const historySection = document.getElementById("historySectionCustomer");
    const historyList = document.getElementById("historyListCustomer");

    if (historySection && historyList && Array.isArray(data.history)) {
        historySection.style.display = "block";
        historyList.innerHTML = "";

        data.history.forEach(item => {
            const div = document.createElement("div");
            div.className = "history-item";
            div.innerHTML = `
                <div style="display: flex; flex-direction: column;">
                    <strong>${item.itemName}</strong> x${item.qty}
                    <span style="font-size: 12px; color: gray;">oleh ${item.name}</span>
                </div>
            `;
            historyList.appendChild(div);
            });
        }
    }

});

function renderHistory(historyList) {
    const historyElement = document.getElementById("historyList");
    if (!historyElement || !Array.isArray(historyList)) return;

    historyElement.innerHTML = "";

    historyList.forEach(entry => {
        const item = document.createElement("div");
        item.className = "history-item";
        item.innerText = `${entry.qty}x ${entry.itemName} oleh ${entry.name}`;
        historyElement.appendChild(item);
    });
}

function handleBayar() {
    if (troliItems.length === 0) return;

    setBayarEnabled(false);

    const queueItem = document.getElementById("queueItem");
    const queueBar = document.getElementById("queueBar");
    const queueFill = document.getElementById("queueFill");

    if (!queueItem || !queueBar || !queueFill) return;

    queueItem.innerText = "Memproses pesanan...";
    queueBar.style.display = "block";
    queueFill.style.width = "0%";

    let progress = 0;
    const interval = setInterval(() => {
        progress += 2;
        queueFill.style.width = `${progress}%`;

        if (progress >= 100) {
            clearInterval(interval);
            selesaiBayar();
        }
    }, 100);
}

function handleTambahTroli() {
    if (!selectedMakanan || Object.keys(bahanTroli).length === 0) return;

    if (selectedMakanan.type === "paket") {
        const existing = troliItems.find(i => i.name === selectedMakanan.item);
        if (existing) {
            existing.qty += 1;
        } else {
            troliItems.push({
                name: selectedMakanan.item,
                qty: 1,
                type: "paket",
                label: selectedMakanan.label,
                image: selectedMakanan.image
            });
        }
    }
    else {
        for (let itemName in bahanTroli) {
            const qty = bahanTroli[itemName];
            const existing = troliItems.find(i => i.name === itemName);
            if (existing) {
                existing.qty += qty;
            } else {
                troliItems.push({
                    name: itemName,
                    qty: qty,
                    label: getLabelFromItemName(itemName),
                    image: semuaBahan[itemName]?.image || itemName
                });
            }
        }
    }

    renderTroli();
    document.getElementById("layout3").style.display = "flex";
}

function renderMakananList(makananData, isCustomer = false) {
    const container = document.getElementById("makananList");
    container.innerHTML = "";
    semuaBahan = {};

    for (let key in makananData) {
        const item = makananData[key];

        if (item.type === "makanan" && item.bahan) {
            item.bahan.forEach(b => {
                semuaBahan[b.item] = { label: b.label, image: b.item };
            });
        }

        if (item.type === "paket" && item.isi) {
            item.isi.forEach(i => {
                if (!semuaBahan[i.item]) {
                    semuaBahan[i.item] = { label: i.item, image: i.item, harga: 0 };
                }
            });
        }

        const displayHarga = isCustomer ? `Harga: $${item.harga}` : "";

        const div = document.createElement("div");
        div.className = "makanan-item";
        div.innerHTML = `
            <img src="https://cfx-nui-ox_inventory/web/images/${item.image}.png" alt="${item.label}" class="item-img">
            <div style="flex: 1;">
                <strong>${item.label}</strong><br>
                ${displayHarga}
            </div>
        `;

        div.addEventListener("click", () => {
            selectedMakanan = item;
            if (item.type === "paket") {
                renderIsiPaket(item);
            } else if (isCustomer) {
                renderBahanListForCustomer(item);
            } else {
                renderBahanList(item.bahan);
            }
        });

        container.appendChild(div);
    }
}

function renderIsiPaket(paketData) {
    const container = document.getElementById("bahanList");
    container.innerHTML = "";
    bahanTroli = {};
    for (let i of paketData.isi) {
        bahanTroli[i.item] = i.qty;
        const image = semuaBahan[i.item]?.image || i.item;
        const label = semuaBahan[i.item]?.label || i.item;

        const div = document.createElement("div");
        div.className = "makanan-item";
        div.innerHTML = `
            <img src="https://cfx-nui-ox_inventory/web/images/${image}.png" class="item-img">
            <div style="flex: 1;">
                <strong>${label}</strong><br>
                Jumlah: ${i.qty}
            </div>
        `;
        container.appendChild(div);
    }
    document.getElementById("layout2").style.display = "flex";
}


function renderBahanList(bahanData) {
    const container = document.getElementById("bahanList");
    container.innerHTML = "";
    bahanTroli = {};

    for (let item of bahanData) {
        const key = item.item;
        bahanTroli[key] = 1;

        const div = document.createElement("div");
        div.className = "makanan-item";
        div.innerHTML = `
            <img src="https://cfx-nui-ox_inventory/web/images/${key}.png" class="item-img">
            <div style="flex: 1;">
                <strong>${item.label}</strong><br>
                Harga: $${item.harga}
                <div class="quantity-controls">
                    <button class="quantity-btn" onclick="ubahJumlah('${key}', -1)">-</button>
                    <span id="qty-bahan-${key}">1</span>
                    <button class="quantity-btn" onclick="ubahJumlah('${key}', 1)">+</button>
                </div>
            </div>
        `;
        container.appendChild(div);
    }

    document.getElementById("layout2").style.display = "flex";
}

function renderBahanListForCustomer(makananItem) {
    const container = document.getElementById("bahanList");
    container.innerHTML = "";

    const key = makananItem.item;
    bahanTroli = {};
    bahanTroli[key] = 1;

    const div = document.createElement("div");
    div.className = "makanan-item";
    div.innerHTML = `
        <img src="https://cfx-nui-ox_inventory/web/images/${makananItem.image}.png" class="item-img">
        <div style="flex: 1;">
            <strong>${makananItem.label}</strong><br>
            <div class="quantity-controls">
                <button class="quantity-btn" onclick="ubahJumlah('${key}', -1)">-</button>
                <span id="qty-bahan-${key}">1</span>
                <button class="quantity-btn" onclick="ubahJumlah('${key}', 1)">+</button>
            </div>
        </div>
    `;

    container.appendChild(div);
    document.getElementById("layout2").style.display = "flex";
}


function ubahJumlah(itemName, change) {
    if (bahanTroli[itemName] === undefined) return;
    bahanTroli[itemName] = Math.max(1, bahanTroli[itemName] + change);

    const qtySpan = document.getElementById(`qty-bahan-${itemName}`);
    if (qtySpan) {
        qtySpan.innerText = bahanTroli[itemName];
    }
}

function renderTroli() {
    const container = document.getElementById("troliList");
    container.innerHTML = "";

    troliItems.forEach(item => {
        const div = document.createElement("div");
        div.className = "makanan-item";
        div.innerHTML = `
            <img src="https://cfx-nui-ox_inventory/web/images/${item.image}.png" class="item-img">
            <div style="flex: 1;">
                <strong>${item.label}</strong><br>
                Jumlah: ${item.qty}
            </div>
        `;
        container.appendChild(div);
    });

    setBayarEnabled(true);
}

function getLabelFromItemName(itemName) {
    return semuaBahan[itemName]?.label || itemName;
}

function addToHistory(itemName, qty, playerName) {
    const now = new Date().toLocaleTimeString();
    const container = document.getElementById("historyList");
    const label = getLabelFromItemName(itemName);
    const image = semuaBahan[itemName]?.image || itemName;

    const div = document.createElement("div");
    div.className = "history-item";
    div.innerHTML = `
        <img src="https://cfx-nui-ox_inventory/web/images/${image}.png" class="item-img" style="width: 30px; height: 30px;">
        <div class="details">
            ${label} x${qty}<br>
            <span class="timestamp">${now} - ${playerName}</span>
        </div>
    `;

    container.prepend(div);
}

function selesaiBayar() {
    const queueItem = document.getElementById("queueItem");
    const queueBar = document.getElementById("queueBar");

    if (queueItem && queueBar) {
        queueItem.innerText = "Tidak ada proses";
        queueBar.style.display = "none";
    }

    if (isCustomerMode) {
        fetch(`https://${GetParentResourceName()}/confirmCustomerOrder`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ items: troliItems }),
        }).then(() => {
            closeUI();
        });
    } else {
        fetch(`https://${GetParentResourceName()}/bayarBahan`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ items: troliItems }),
        }).then(() => {
            closeUI();
        });
    }

    troliItems = [];
    document.getElementById("troliList").innerHTML = "";
    document.getElementById("layout3").style.display = "none";
}

function closeUI() {
    ["layout1", "layout2", "layout3"].forEach(id => {
        const el = document.getElementById(id);
        if (el) el.style.display = "none";
    });
    
    selectedMakanan = null;
    bahanTroli = {};
    troliItems = [];

    ["makananList", "bahanList", "troliList", "historyList"].forEach(id => {
        const el = document.getElementById(id);
        if (el) el.innerHTML = "";
    });

    const queueItem = document.getElementById("queueItem");
    const queueBar = document.getElementById("queueBar");

    if (queueItem && queueBar) {
        queueItem.innerText = "Tidak ada proses";
        queueBar.style.display = "none";
    }

    fetch(`https://${GetParentResourceName()}/closeUI`, { method: "POST" });
}

function setBayarEnabled(enabled) {
    const btn = document.getElementById("btnBayar");
    if (btn) btn.disabled = !enabled;
}

window.addEventListener("keydown", (e) => {
    if (e.key === "Escape") {
        closeUI();
    }
});

function renderCustomerMenu(makananList) {
    const container = document.getElementById("makananList");
    container.innerHTML = "";

    makananList.forEach(item => {
        const div = document.createElement("div");
        div.className = "makanan-item";
        div.innerHTML = `
            <img src="https://cfx-nui-ox_inventory/web/images/${item.image}.png" alt="${item.label}" class="item-img">
            <div style="flex:1">
                <strong>${item.label}</strong><br>
                Harga: $${item.harga}
                <div class="quantity-controls">
                    <button onclick="ubahQty('${item.item}', -1)">-</button>
                    <span id="qty-${item.item}">1</span>
                    <button onclick="ubahQty('${item.item}', 1)">+</button>
                </div>
            </div>
        `;
        container.appendChild(div);
    });
    const confirmBtn = document.createElement("button");
    confirmBtn.innerText = "Konfirmasi Pesanan";
    confirmBtn.className = "btn";
    confirmBtn.style.marginTop = "15px";
    confirmBtn.onclick = () => {
    const items = [];
    makananList.forEach(item => {
        const qty = parseInt(document.getElementById(`qty-${item.item}`).innerText);
        if (qty > 0) {
            items.push({
                name: item.item,    
                label: item.label,
                qty: qty
            });
        }
    });
        fetch(`https://${GetParentResourceName()}/confirmCustomerOrder`, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ items: items })
        });
    };
    container.appendChild(confirmBtn);
}

function ubahQty(item, change) {
    const el = document.getElementById(`qty-${item}`);
    if (!el) return;
    let val = parseInt(el.innerText) || 1;
    val = Math.max(1, val + change);
    el.innerText = val;
}
