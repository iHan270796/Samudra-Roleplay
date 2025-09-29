window.addEventListener("message", function(event) {
  if (event.data.action === "start") {
    startMinigame(event.data.rounds || 5);
  } else if (event.data.action === "showFish") {
    showFish(event.data.fish);
  } else if (event.data.action === "cacheFishData") {
    window.fishData = event.data.fish;
  }
});

function startMinigame(totalRounds) {
  showOverlay();
  let round = 0;
  let successCount = 0;

  function runRound() {
    if (round >= totalRounds) {
      const success = successCount === totalRounds;
      hideOverlay();
      fetch("https://deanix_fishingjob/minigameResult", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          success,
          item: window.fishData?.item,
        meta: {
          weight: Number(window.fishData?.meta?.weight || 0)
        }
      })
    });
      return;
    }
    const letter = String.fromCharCode(65 + Math.floor(Math.random() * 26));
    const box = document.createElement("div");
    box.classList.add("falling-box");
    const positions = ["20%", "50%", "80%"];
    const selectedLeft = positions[Math.floor(Math.random() * positions.length)];
      box.style.left = selectedLeft;

    if (selectedLeft === "50%") {
      box.style.transform = "translateX(-50%)";
    } else {
      box.style.transform = "translateX(-30%)";
    }

    const letterDiv = document.createElement("div");
    letterDiv.classList.add("falling-letter");
    letterDiv.innerText = letter;

    box.appendChild(letterDiv);
    document.body.appendChild(box);

    let pressed = false;

    function onKey(e) {
      if (e.key.toUpperCase() === letter) {
        pressed = true;
        successCount++;
        cleanup();
      }
    }

    function cleanup() {
      document.removeEventListener("keydown", onKey);
      box.remove();
      round++;
      setTimeout(runRound, 500);
    }

    document.addEventListener("keydown", onKey);
    const totalDuration = totalRounds * 10000;
    const perRoundTime = totalDuration / totalRounds;

    setTimeout(() => {
      if (!pressed) {
        cleanup();
      }
    }, perRoundTime);
  }

  runRound();
}

function showFish(data) {
  showOverlay();
  document.getElementById("fish-display").classList.remove("hidden");
  document.getElementById("fish-label").innerText = data.label;
  document.getElementById("fish-weight").innerText = `Berat: ${data.meta.weight}kg`;
  document.getElementById("fish-img").src = `nui://ox_inventory/web/images/${data.item}.png`;
  window.fishData = data;
}

function takeFish() {
  hideOverlay();
  document.getElementById("fish-display").classList.add("hidden");
  fetch("https://deanix_fishingjob/fishAction", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({
    take: true,
    item: window.fishData.item,
     meta: { weight: Number(window.fishData.meta.weight) }
    })
  });
}

function discardFish() {
  hideOverlay();
  document.getElementById("fish-display").classList.add("hidden");
  fetch("https://deanix_fishingjob/fishAction", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ take: false })
  });
}

function showOverlay() {
  document.getElementById("overlay").classList.remove("hidden");
}

function hideOverlay() {
  document.getElementById("overlay").classList.add("hidden");
}
