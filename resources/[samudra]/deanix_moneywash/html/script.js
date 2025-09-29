let currentItem = 'markedbills';
let currentAmount = 1;
let washQueue = [];
let cashReady = 0;
let hasMarkedBills = false;
let isWashing = false;
let washTimeout = null;

document.getElementById('leftPanel').style.display = 'none';
document.getElementById('rightPanel').style.display = 'none';
document.getElementById('centerPanel').style.display = 'none';
document.getElementById('takeCashButton').style.display = 'none';

window.addEventListener('message', function(event) {
  const data = event.data;
  if (data.action === "open") {
    hasMarkedBills = data.hasMarkedBills || false;
    updateItemLockStates();
    
    document.body.style.display = "block";
    document.getElementById('app').style.display = 'flex';
    showPanels(['leftPanel']);
  }
});

document.addEventListener('keydown', function(e) {
  if (e.key === 'Escape') {
    fetch(`https://${GetParentResourceName()}/stopWashAnim`, {
      method: 'POST'
    });

    if (washTimeout) {
      clearTimeout(washTimeout);
      washTimeout = null;
    }

    isWashing = false;

    closeUI();
  }
});

function closeUI() {
  fetch(`https://${GetParentResourceName()}/stopWashAnim`, {
    method: 'POST'
  });

  fetch(`https://${GetParentResourceName()}/close`, {
    method: 'POST',
  });

  document.getElementById('app').style.display = 'none';
  document.getElementById('leftPanel').style.display = 'none';
  document.getElementById('rightPanel').style.display = 'none';
  document.getElementById('centerPanel').style.display = 'none';
  currentAmount = 1;
  document.getElementById('amountToWash').innerText = currentAmount;
  if (washTimeout) {
    clearTimeout(washTimeout);
    washTimeout = null;
  }
  isWashing = false;
  washQueue = [];
  document.getElementById('washQueue').innerHTML = '';
}

function showPanels(panelIds) {
  const panels = ['leftPanel', 'rightPanel', 'centerPanel'];
  panels.forEach(panelId => {
    document.getElementById(panelId).style.display = panelIds.includes(panelId) ? 'flex' : 'none';
  });
}

function updateItemLockStates() {
  const button = document.getElementById('markedbillsButton');
  if (!hasMarkedBills) {
    button.classList.add('locked');
    button.disabled = true;
  } else {
    button.classList.remove('locked');
    button.disabled = false;
  }
}

document.querySelectorAll('.wash-item').forEach(button => {
  button.addEventListener('click', () => {
    currentItem = button.dataset.item;
    document.getElementById('selectedItemName').innerText = button.innerText;
    showPanels(['leftPanel', 'rightPanel']);
  });
});

document.getElementById('continueButton').addEventListener('click', () => {
  showPanels(['leftPanel', 'rightPanel', 'centerPanel']);
});

document.getElementById('increaseAmount').addEventListener('click', () => {
  currentAmount++;
  document.getElementById('amountToWash').innerText = currentAmount;
});

document.getElementById('decreaseAmount').addEventListener('click', () => {
  if (currentAmount > 1) {
    currentAmount--;
    document.getElementById('amountToWash').innerText = currentAmount;
  }
});

document.getElementById('startWashButton').addEventListener('click', () => {
  if (isWashing) return;
  isWashing = true;

  fetch(`https://${GetParentResourceName()}/startWash`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({ item: currentItem, amount: currentAmount }),
  })
  .then(res => res.json())
  .then(res => {
    if (res.success) {
      const queueItem = {
        id: Date.now(),
        name: currentItem,
        amount: currentAmount,
        cashResult: res.reward,
      };

      washQueue.push(queueItem);
      addQueueItem(queueItem);
      addHistoryItem(queueItem);

      fetch(`https://${GetParentResourceName()}/playWashAnim`, {
        method: 'POST'
      });

      washTimeout = setTimeout(() => {
        cashReady += queueItem.cashResult;
        updateCashDisplay();
        isWashing = false;
      }, 10000); // 10 detik
    } else {
      isWashing = false;
    }

    currentAmount = 1;
    document.getElementById('amountToWash').innerText = currentAmount;
    showPanels(['leftPanel', 'rightPanel', 'centerPanel']);
  })
  .catch(err => {
    console.error('Error:', err);
    isWashing = false;
  });
});

function addQueueItem(item) {
  const ul = document.getElementById('washQueue');

  const li = document.createElement('li');
  li.className = 'queue-item';

  li.innerHTML = `
    <div class="queue-content">
      <img src="nui://ox_inventory/web/images/${item.name}.png" class="queue-icon" />
      <span>${item.amount}x ${item.name}</span>
    </div>
    <div class="progress-container">
      <div class="progress-bar" style="width: 0%;"></div>
    </div>
  `;

  ul.prepend(li);

  let progress = 0;
  const interval = setInterval(() => {
    progress += 1;
    li.querySelector('.progress-bar').style.width = `${progress}%`;
    if (progress >= 100) clearInterval(interval);
  }, 30);
}

function addHistoryItem(item) {
  const ul = document.getElementById('washHistory');

  const li = document.createElement('li');
  li.className = 'history-item';

  li.innerHTML = `
    <div class="history-content">
      <img src="nui://ox_inventory/web/images/${item.name}.png" class="history-icon" />
      <span>${item.amount}x ${item.name}</span>
    </div>
    <div class="history-result">
      <span>$${item.cashResult}</span>
    </div>
  `;

  ul.prepend(li);
}

function updateCashDisplay() {
  document.getElementById('cashResult').innerText = `$${cashReady}`;
  if (cashReady > 0) {
    document.getElementById('takeCashButton').style.display = 'inline-block';
  }
}

document.getElementById('takeCashButton').addEventListener('click', () => {

  fetch(`https://${GetParentResourceName()}/stopWashAnim`, {
    method: 'POST'
  });

  fetch(`https://${GetParentResourceName()}/takeCash`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({ amount: cashReady }),
  });

  cashReady = 0;
  updateCashDisplay();
  document.getElementById('cashResult').innerText = '$0';
  document.getElementById('takeCashButton').style.display = 'none';
});
