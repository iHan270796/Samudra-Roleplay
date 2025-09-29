window.addEventListener('message', function(event) {
    const data = event.data;
    if (data.action === "showWarning") {
        const container = document.getElementById("warning-container");

        const warn = document.createElement("div");
        warn.classList.add("warning");
        warn.classList.add(data.color); // red/blue

        let icon = "⚠️";
        if (data.color === "red") icon = "🍗";   // lapar
        if (data.color === "blue") icon = "💧"; // haus

        warn.innerHTML = `<i>${icon}</i> ${data.text}`;

        container.appendChild(warn);

        // Hapus setelah 10 detik
        setTimeout(() => {
            warn.remove();
        }, 10000);
    }
});
