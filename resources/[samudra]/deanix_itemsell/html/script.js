let selectedItem = null;
let selectedQty = 0;
let sellQueue = [];
let history = [];
let isSelling = false;
let cancelSelling = false;

window.addEventListener("message", function (event) {
  const data = event.data;
  if (data.action === "openSellUI") {
    cancelSelling = false;
    document.body.style.display = "block";
    resetUI();
    if (data.items) loadItems(data.items);
  } else if (data.action === "closeSellUI") {
    document.body.style.display = "none";
  }
});

function getResourceName() {
  return typeof GetParentResourceName === "function"
    ? GetParentResourceName()
    : "test-resource";
}

function resetUI() {
  document.getElementById("item-details").classList.add("hidden");
  selectedItem = null;
  selectedQty = 0;
}

function loadItems(items) {
  const list = document.getElementById("item-list");
  list.innerHTML = "";

  items.forEach((item) => {
    const hasItem = parseInt(item.amount ?? 0, 10) > 0;

    const el = document.createElement("div");
    el.className = "item";
    el.innerHTML = `
      <img src="https://cfx-nui-ox_inventory/web/images/${item.name}.png" alt="${item.label}" onerror="this.src='fallback.png'">
      <span class="item-label">
        ${item.label} ${!hasItem ? '<span class="lock-symbol">🔒</span>' : ''}
      </span>
    `;

    if (hasItem) {
      el.onclick = () => selectItem(item);
      el.style.cursor = "pointer";
    } else {
      el.style.opacity = "0.6";
      el.style.pointerEvents = "none";
    }

    list.appendChild(el);
  });
}

function selectItem(item) {
  selectedItem = item;
  selectedQty = 0;

  const details = document.getElementById("item-details");
  if (details.classList.contains("hidden")) {
    details.classList.remove("hidden");
  }

  document.getElementById("item-image").src = `https://cfx-nui-ox_inventory/web/images/${item.name}.png`;
  document.getElementById("item-label").innerText = item.label;
  document.getElementById("item-price").innerText = `$${item.price}`;
  document.getElementById("qty").value = selectedQty;

  const sellBtn = document.getElementById("sell-btn");
  const itemAmount = parseInt(item.amount ?? 0, 10);

  if (itemAmount > 0) {
    sellBtn.disabled = false;
    sellBtn.classList.remove("disabled");
    sellBtn.style.cursor = "pointer";
  } else {
    sellBtn.disabled = true;
    sellBtn.classList.add("disabled");
    sellBtn.style.cursor = "not-allowed";
  }
}

function adjustQty(amount) {
  if (!selectedItem) return;

  const maxQty = parseInt(selectedItem.amount ?? 0, 10);
  const newQty = selectedQty + amount;

  if (newQty > maxQty) {
    notify(`Kamu hanya punya ${maxQty}x ${selectedItem.label}`, "error");
  }

  selectedQty = Math.max(0, Math.min(newQty, maxQty));
  document.getElementById("qty").value = selectedQty;
}



function sellSelectedItem() {
  if (!selectedItem || selectedQty <= 0) return;

  const sellBtn = document.getElementById("sell-btn");
  const spinner = document.getElementById("sell-spinner");
  const sellText = document.getElementById("sell-text");

  sellBtn.disabled = true;
  spinner.style.display = "inline-block";
  sellText.textContent = "Menjual...";

  const entry = {
    name: selectedItem.name,
    label: selectedItem.label,
    quantity: selectedQty,
    price: selectedItem.price,
    image: `https://cfx-nui-ox_inventory/web/images/${selectedItem.name}.png`,
  };

  setTimeout(() => {
    sellQueue.push(entry);
    if (!isSelling) processQueue();

    notify("Barang dimasukkan ke antrian penjualan.", "success");

    sellText.textContent = "Jual";
    spinner.style.display = "none";
    sellBtn.disabled = false;
  }, 1000);
}

function updateQueueUI() {
  const queueDiv = document.getElementById("queue");
  queueDiv.innerHTML = "<h3>Antrian Penjualan</h3>";
  sellQueue.forEach((entry, index) => {
    const div = document.createElement("div");
    div.className = "queue-item";
    div.innerHTML = `
      <img src="${entry.image}" width="30" height="30" onerror="this.style.border='2px solid red'">
      <div style="width: 100%">
        <div>${entry.label} x${entry.quantity}</div>
        <div class="progress-bar"><div class="progress-bar-fill" id="progress-${index}"></div></div>
      </div>
    `;
    queueDiv.appendChild(div);
  });
}

function processQueue() {
  if (sellQueue.length === 0 || cancelSelling) {
    isSelling = false;
    return;
  }

  isSelling = true;
  updateQueueUI();
  const entry = sellQueue[0];
  const progress = document.getElementById("progress-0");
  let percent = 0;

  const interval = setInterval(() => {
    if (cancelSelling) {
      clearInterval(interval);
      sellQueue = [];
      updateQueueUI();
      isSelling = false;
      return;
    }

    percent += 1;
    if (progress) progress.style.width = `${percent}%`;

    if (percent >= 100) {
      clearInterval(interval);
      sendSell(entry);
      addToHistory(entry);
      sellQueue.shift();

      setTimeout(() => {
        processQueue();
      }, 100);
    }
  }, 30);
}

function addToHistory(entry) {
  history.unshift(entry);
  const historyDiv = document.getElementById("history");
  historyDiv.innerHTML = "<h3>Riwayat Penjualan</h3>";
  history.slice(0, 10).forEach((item) => {
    const div = document.createElement("div");
    div.className = "history-item";
    div.innerHTML = `
      <img src="${item.image}" width="30" height="30" onerror="this.style.border='2px solid red'">
      <div>
        <div>${item.label} x${item.quantity}</div>
        <div>Total: $${item.quantity * item.price}</div>
      </div>
    `;
    historyDiv.appendChild(div);
  });
}

function sendSell(entry) {
  fetch(`https://${getResourceName()}/sellQueueItem`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(entry),
  });
}

function notify(message, type = "info") {
  fetch(`https://${getResourceName()}/notify`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ message, type }),
  });
}

function updateQtyFromInput() {
  if (!selectedItem) return;
  const input = document.getElementById("qty");
  let value = parseInt(input.value, 10);

  if (isNaN(value) || value < 0) value = 0;

  const maxQty = parseInt(selectedItem.amount ?? 0, 10);
  if (value > maxQty) {
    notify(`Kamu hanya punya ${maxQty}x ${selectedItem.label}`, "error");
    value = maxQty;
  }

  selectedQty = value;
  input.value = selectedQty;
}


document.addEventListener("keydown", function (event) {
  if (event.key === "Escape") {
    // 🔥 Trigger cancel
    cancelSelling = true;
    sellQueue = [];
    updateQueueUI();

    notify("Penjualan dibatalkan.", "error");

    fetch(`https://${getResourceName()}/close`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
    });

    document.body.style.display = "none";
    resetUI();
  }
});
