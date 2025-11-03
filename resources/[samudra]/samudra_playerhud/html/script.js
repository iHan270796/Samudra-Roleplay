window.addEventListener('message', function (event) {
    const data = event.data;

    if (data.action === 'updateHUD') {
        document.getElementById('playerName').textContent = `${data.data.name} (${data.data.id})`;
        document.querySelector('.job').textContent = `${data.data.job} - ${data.data.grade}`;
        document.querySelector('.gang').textContent = data.data.gang || 'No Gang';
        document.querySelector('.cash').textContent = `$${data.data.cash.toLocaleString()}`;
        document.querySelector('.bank').textContent = `$${data.data.bank.toLocaleString()}`;
    }

    if (data.action === 'hideHUD') {
        document.getElementById('hud').style.opacity = '0';
        document.getElementById('hud').style.transition = 'opacity 0.4s ease';
    }

    if (data.action === 'showHUD') {
        document.getElementById('hud').style.opacity = '1';
        document.getElementById('hud').style.transition = 'opacity 0.4s ease';
    }
});

setInterval(() => {
    const now = new Date();
    const hours = now.getHours().toString().padStart(2, '0');
    const minutes = now.getMinutes().toString().padStart(2, '0');
    const month = (now.getMonth() + 1).toString().padStart(2, '0');
    const day = now.getDate().toString().padStart(2, '0');
    const year = now.getFullYear();

    document.getElementById('time').textContent = `${hours}:${minutes}`;
    document.getElementById('date').textContent = `${month}/${day}/${year}`;
}, 1000);
