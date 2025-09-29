let salahCounter = 0;

window.addEventListener('message', function (event) {
  const data = event.data;

  if (data.action === 'showCodePanel') {
    document.querySelector('.left-panel').style.display = 'flex';
    document.querySelector('.right-panel').style.display = 'none';
    document.querySelector('.center-panel').style.display = 'none';
  }

  if (data.action === 'showCodeResult') {
    document.querySelector('.right-panel').style.display = 'flex';
    document.getElementById('kode-angka').innerText = data.code;
    setTimeout(() => {
      fetch(`https://${GetParentResourceName()}/closeUI`, {
        method: 'POST'
      });
    }, 10000);
  }

  if (data.action === 'hideAll') {
    document.querySelector('.left-panel').style.display = 'none';
    document.querySelector('.right-panel').style.display = 'none';
    document.querySelector('.center-panel').style.display = 'none';
  }
});

function ambilKode() {
  fetch(`https://${GetParentResourceName()}/ambilKode`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({})
  });

  document.getElementById("queue-status").innerText = "Kode akan hilang...";

  const progressBar = document.getElementById("progress-bar");
  const progressContainer = document.getElementById("progress-bar-container");

  progressContainer.style.display = "block";
  progressBar.style.width = "0%";

  setTimeout(() => {
    progressBar.style.width = "100%";
  }, 50);

  setTimeout(() => {
    fetch(`https://${GetParentResourceName()}/closeUI`, {
      method: 'POST'
    });
  }, 10000);
}

function closeUI() {
  fetch(`https://${GetParentResourceName()}/closeUI`, {
    method: 'POST'
  });
}

window.addEventListener('message', function (event) {
  const data = event.data;

  if (data.action === 'showVaultInput') {
    document.querySelector('.left-panel').style.display = 'none';
    document.querySelector('.right-panel').style.display = 'none';
    document.querySelector('.center-panel').style.display = 'flex';
  }

  if (data.action === 'showFinalReward') {
    const itemName = data.item;
    const amount = data.amount || 1;

    document.getElementById('reward-image').src = `nui://ox_inventory/web/images/${itemName}.png`;
    document.getElementById('reward-amount').innerText = `x${amount}`;
    document.getElementById('reward-section').style.display = 'flex';
  }
});

function submitCode() {
  const code = document.getElementById('input-kode').value;
  const button = document.querySelector('#submit-btn');
  button.disabled = true;

  fetch(`https://${GetParentResourceName()}/submitCode`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ code: code })
  })
    .then(res => res.json())
    .then(data => {
      if (data.success) {
      } else {
        salahCounter++;
        if (salahCounter >= 3) {
          closeUI();
        } else {
          button.disabled = false;
        }
      }
    });
}

function ambilUangMerah() {
  fetch(`https://${GetParentResourceName()}/ambilUangMerah`, {
    method: 'POST'
  });
}
