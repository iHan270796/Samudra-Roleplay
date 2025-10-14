let keys = ['W', 'A', 'S', 'D'];
let currentKey = 'W';
let attempt = 0;
let success = 0;
let barInterval;

const minigame = document.getElementById('minigame');
const keyDisplay = document.getElementById('key');
const blueZone = document.getElementById('blueZone');
const movingBar = document.getElementById('movingBar');

function startMinigame() {
  attempt = 0;
  success = 0;
  minigame.style.display = 'flex';
  nextAttempt();
}

function nextAttempt() {
  if (attempt >= 3) {
    endMinigame();
    return;
  }

  attempt++;
  currentKey = keys[Math.floor(Math.random() * keys.length)];
  keyDisplay.innerText = currentKey;
  randomizeBlueZone();
  startMovingBar();
}

function randomizeBlueZone() {
  const track = document.getElementById('track');
  const trackWidth = track.offsetWidth;
  const blueZoneWidth = blueZone.offsetWidth;
  const maxLeft = trackWidth - blueZoneWidth;

  const left = Math.floor(Math.random() * maxLeft);
  blueZone.style.left = `${left}px`;
}

function startMovingBar() {
  clearInterval(barInterval);
  const track = document.getElementById('track');
  const trackWidth = track.offsetWidth;
  const movingBarWidth = movingBar.offsetWidth;

  movingBar.style.left = '0px';
  let startTime = Date.now();
  let duration = 2500; // 2 seconds

  barInterval = setInterval(() => {
    let elapsed = Date.now() - startTime;
    let progress = Math.min(elapsed / duration, 1);
    let newLeft = (trackWidth - movingBarWidth) * progress;
    movingBar.style.left = `${newLeft}px`;

    if (progress >= 1) {
      clearInterval(barInterval);
      nextAttempt(); // auto next if player doesn't press in time
    }
  }, 16);
}

function checkSuccess() {
  const blueRect = blueZone.getBoundingClientRect();
  const barRect = movingBar.getBoundingClientRect();

  return (
    barRect.left >= blueRect.left &&
    barRect.right <= blueRect.right
  );
}

document.addEventListener('keydown', (e) => {
  if (minigame.style.display !== 'flex') return;

  if (e.key.toUpperCase() === currentKey) {
    clearInterval(barInterval);
    if (checkSuccess()) success++;
    nextAttempt();
  }
});

function endMinigame() {
  clearInterval(barInterval);
  minigame.style.display = 'none';

  fetch(`https://${GetParentResourceName()}/minigameDone`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ success: success })
  });
}

window.addEventListener('message', function (event) {
  if (event.data.action === 'startMinigame') {
    startMinigame();
  }
});
