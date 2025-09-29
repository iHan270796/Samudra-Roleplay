let layout1 = document.getElementById('layout1');
let layout2 = document.getElementById('layout2');
let layout3 = document.getElementById('layout3');

let kodeDisplay = document.getElementById('kodeDisplay');
let queueProgress = document.getElementById('queueProgress');
let ambilKodeBtn = document.getElementById('ambilKodeBtn');
let queueStatus = document.getElementById('queueStatus');

let codeInput = document.getElementById('codeInput');
let submitCodeBtn = document.getElementById('submitCodeBtn');

let currentCode = null;
let queueTime = 0;
let queueStarted = false;

let layout4 = document.getElementById('layout4');
let rewardImage = document.getElementById('rewardImage');
let rewardLabel = document.getElementById('rewardLabel');
let ambilRewardBtn = document.getElementById('ambilRewardBtn');

window.addEventListener('message', function (event) {
    const data = event.data;

    if (data.action === "showLayout1") {
        layout1.style.display = "flex";
        layout2.style.display = "none";
        ambilKodeBtn.disabled = false;
        kodeDisplay.innerText = "------";
        queueProgress.style.width = "0%";
        queueStatus.innerText = "Menunggu pengambilan kode...";
        queueStarted = false;
        currentCode = data.code;
        queueTime = data.queueTime;
    }

    if (data.action === "showCodeInput") {
        layout3.style.display = "flex";
        codeInput.value = "";
        codeInput.focus();
    }

    if (data.action === "showLayout4") {
        layout4.style.display = "flex";
        rewardLabel.innerText = data.item || "Reward Tidak Dikenal";
        rewardImage.src = `nui://ox_inventory/web/images/${data.item}.png`;
    }

    if (data.action === "closeLayouts") {
        closeUI();
    }
});

// Ambil Kode
ambilKodeBtn.addEventListener('click', function () {
    if (queueStarted) return;
    queueStarted = true;

    ambilKodeBtn.disabled = true;
    layout2.style.display = "flex";
    kodeDisplay.innerText = currentCode || "------";
    queueStatus.innerText = "Kode akan hilang...";
    startQueueBar(queueTime);
});

// Proses bar jalan
function startQueueBar(duration) {
    let progress = 0;
    let interval = 50;
    queueProgress.style.width = '0%';

    let timer = setInterval(() => {
        progress += interval;
        let percent = Math.min((progress / duration) * 100, 100);
        queueProgress.style.width = percent + '%';

        if (progress >= duration) {
            clearInterval(timer);
            closeUI();
        }
    }, interval);
}

// Input Kode & kirim ke Lua
submitCodeBtn.addEventListener('click', function () {
    const code = codeInput.value.trim();
    if (code.length !== 6) return;

    fetch(`https://${GetParentResourceName()}/submitCode`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ code: code })
    });

    layout3.style.display = "none";
});

ambilRewardBtn.addEventListener('click', function () {
    ambilRewardBtn.disabled = true;
    layout4.style.display = "none";

    fetch(`https://${GetParentResourceName()}/takeReward`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({})
    });
});

// Tutup semua UI
function closeUI() {
    layout1.style.display = "none";
    layout2.style.display = "none";
    layout3.style.display = "none";
    layout4.style.display = "none";

    fetch(`https://${GetParentResourceName()}/closeUI`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({})
    });
}
