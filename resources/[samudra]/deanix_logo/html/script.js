let hudVisible = true;
let inVehicleState = false;

window.addEventListener('message', function(event) {
    const data = event.data;

    if (data.action === "update") {
        document.getElementById("player-id").innerHTML = "<i class='fa-solid fa-id-badge'></i> " + data.id;
        document.getElementById("job").innerHTML = data.jobIcon + " " + data.job;
        document.getElementById("gang").innerHTML = data.gangIcon + " " + data.gang;
        document.getElementById("bank").innerHTML = "<i class='fa-solid fa-university'></i> $" + data.bank.toLocaleString();
        document.getElementById("cash").innerHTML = "<i class='fa-solid fa-money-bill-wave'></i> $" + data.cash.toLocaleString();
    }

    if (data.action === "show") {
    hudVisible = true;
    const hud = document.getElementById("hud");
    const voiceHud = document.getElementById("voice-hud");
    const weaponHud = document.getElementById("weapon-hud");
    const crosshair = document.getElementById("crosshair");

    hud.style.display = "flex";
    voiceHud.style.display = "flex";
    weaponHud.style.display = "flex";

    hud.classList.remove("hiding");
    voiceHud.classList.remove("hiding");
    weaponHud.classList.remove("hiding");

    hud.classList.add("showing");
    voiceHud.classList.add("showing");
    weaponHud.classList.add("showing");

    if (crosshair) crosshair.classList.remove("hidden");

    applyVehicleState();
    scaleHUD();
}

    if (data.action === "hide") {
        hudVisible = false;
        const hud = document.getElementById("hud");
        const voiceHud = document.getElementById("voice-hud");
        const weaponHud = document.getElementById("weapon-hud");
        const crosshair = document.getElementById("crosshair");

        hud.classList.remove("showing");
        voiceHud.classList.remove("showing");
        weaponHud.classList.remove("showing");

        hud.classList.add("hiding");
        voiceHud.classList.add("hiding");
         weaponHud.classList.add("hiding");

        if (crosshair) crosshair.classList.add("hidden");

        setTimeout(() => {
            if (!hudVisible) {
                hud.style.display = "none";
                voiceHud.style.display = "none";
                weaponHud.style.display = "none";
            }
        }, 400);
    }

    if (data.action === "updateWeapon" && hudVisible) {
    const weaponHud = document.getElementById("weapon-hud");
    const crosshair = document.getElementById("crosshair");

    if (data.weapon) {
        weaponHud.classList.remove("hidden");
        document.getElementById("weapon-icon").className = data.weapon.icon;
        document.getElementById("ammo-count").textContent = `${data.ammoClip} / ${data.ammoTotal}`;

    if (data.crosshair) {
        crosshair.classList.remove("hidden", "dot", "cross", "plus", "circle"); 
        crosshair.classList.add(data.crosshair.type);
        crosshair.style.setProperty("--color", data.crosshair.color);
        crosshair.style.setProperty("--size", data.crosshair.size + "px");
        crosshair.classList.remove("hidden");
    }
        } else {
            weaponHud.classList.add("hidden");
            crosshair.classList.add("hidden");
        }
    }

    if (data.action === "voice" && hudVisible) {
        const voiceHud = document.getElementById("voice-hud");
        if (data.talking) {
            voiceHud.classList.add("talking");
        } else {
            voiceHud.classList.remove("talking");
        }
    }

    if (data.action === "radio" && hudVisible) {
        const radioHud = document.getElementById("radio-hud");
        if (data.enabled) {
            radioHud.classList.remove("hidden");
        } else {
            radioHud.classList.add("hidden");
        }
    }

    if (data.action === "vehicleHud" && hudVisible) {
    inVehicleState = data.inVehicle;

    applyVehicleState();

    scaleHUD();
}
    
});

document.addEventListener("DOMContentLoaded", () => {
    scaleHUD();
    setTimeout(scaleHUD, 150);
});

window.addEventListener("load", () => {
    scaleHUD();
});

function scaleHUD() {
    const baseWidth = 1920;
    const baseHeight = 1080;
    const scaleX = window.innerWidth / baseWidth;
    const scaleY = window.innerHeight / baseHeight;
    const scale = Math.min(scaleX, scaleY);

    const hud = document.getElementById("hud-wrapper");
    const offsetY = (window.innerHeight - baseHeight * scale) / 2;
    hud.style.transform = `translate(0px, ${offsetY}px) scale(${scale})`;
}

function applyVehicleState() {
    const bottomHud = document.getElementById("bottom-hud");
    const voiceHud = document.getElementById("voice-hud");
    const radioHud = document.getElementById("radio-hud");

    [bottomHud, voiceHud, radioHud].forEach(el => {
        if (!el) return;

        if (inVehicleState) {
            el.classList.add("in-vehicle");
        } else {
            el.classList.remove("in-vehicle");
        }
    });
}

window.addEventListener("resize", scaleHUD);
window.addEventListener("load", scaleHUD);