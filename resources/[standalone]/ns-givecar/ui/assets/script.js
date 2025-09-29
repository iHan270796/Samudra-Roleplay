document.addEventListener("DOMContentLoaded", function () {
    function makeDraggable(controlBoxId, targetBoxId) {
        let controlBox = document.getElementById(controlBoxId);
        let targetBox = document.getElementById(targetBoxId);
        if (!controlBox || !targetBox) {
            console.error(`Element not found: ${controlBoxId} or ${targetBoxId}`);
            return;
        }
        controlBox.addEventListener('mousedown', function (event) {
            let shiftX = event.clientX - targetBox.getBoundingClientRect().left;
            let shiftY = event.clientY - targetBox.getBoundingClientRect().top;
            function moveAt(pageX, pageY) {
                targetBox.style.left = pageX - shiftX + 'px';
                targetBox.style.top = pageY - shiftY + 'px';
            }
            function onMouseMove(event) {
                moveAt(event.pageX, event.pageY);
            }
            document.addEventListener('mousemove', onMouseMove);
            document.addEventListener('mouseup', function () {
                document.removeEventListener('mousemove', onMouseMove);
            }, { once: true });
        });
    }
    makeDraggable('aracmenu-header', 'aracmenu');
    makeDraggable('renkmenu-header', 'renkmenu');
});

window.addEventListener('message', function(event) {
    if (event.data.type === "givecar") {
        $('.root').css('display', 'block');
        $("#steamphoto").attr("src", event.data.steampp);
        $('.username').html(event.data.steamname);
    }
});

document.addEventListener("DOMContentLoaded", () => {
    const onaylaButon = document.getElementById('onaylabuton');
    if (onaylaButon) {
        onaylaButon.addEventListener('click', () => {
            const oyuncuID = document.querySelector('.kategori .input')?.value.trim() || '';
            const aracKodu = document.querySelectorAll('.kategori .input')[1]?.value.trim() || '';
            const plaka = document.querySelector('.son-kategori .input')?.value.trim() || '';
            const fullmod = document.querySelector('.upgrades-section input[type="checkbox"]')?.checked || false;
            const hexToRgb = (hex) => {
                if (!hex) return "rgb(0, 0, 0)";
                let r = parseInt(hex.substring(1, 3), 16);
                let g = parseInt(hex.substring(3, 5), 16);
                let b = parseInt(hex.substring(5, 7), 16);
                return `${r} ${g} ${b}`;
            };
            const aracRenk1 = hexToRgb(document.querySelector('.renkler .anarenk .colorpicker')?.value || '#000000');
            const aracRenk2 = hexToRgb(document.querySelectorAll('.renkler .kategorirenk .colorpicker')[1]?.value || '#000000');
            console.log("Oyuncu ID:", oyuncuID);
            console.log("Araç Kodu:", aracKodu);
            console.log("Plaka:", plaka);
            console.log("Neon Aktif:", fullmod);
            console.log("Araç Renk 1:", aracRenk1);
            console.log("Araç Renk 2:", aracRenk2);
            fetch('https://ns-givecar/givecar', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    oyuncuID,
                    aracKodu,
                    plaka,
                    fullmod,
                    aracRenk1,
                    aracRenk2
                })
            });
            $('.root').css('display', 'none');
        });
    }
    $(document).keyup(function (e) {
        if (e.keyCode == 27) {
          $(".root").css("display", "none");
          $.post("https://ns-givecar/closemenu");
        }
      });
      const input = document.getElementById("car-input");
      input.addEventListener("input", function(e) {
        const modelName = e.target.value.toLowerCase();
        if (modelName.length > 2) {
            fetch(`https://ns-givecar/showCarPreview`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ model: modelName })
            });
        }
    });

    function hexToRgb(hex) {
        const bigint = parseInt(hex.replace("#", ""), 16);
        const r = (bigint >> 16) & 255;
        const g = (bigint >> 8) & 255;
        const b = bigint & 255;
        return [r, g, b];
    }
    
    document.getElementById("primary-color").addEventListener("input", function(e) {
        const [r, g, b] = hexToRgb(e.target.value);
        fetch("https://ns-givecar/updateCarColor", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ type: "primary", r, g, b })
        });
    });
    
    document.getElementById("secondary-color").addEventListener("input", function(e) {
        const [r, g, b] = hexToRgb(e.target.value);
        fetch("https://ns-givecar/updateCarColor", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ type: "secondary", r, g, b })
        });
    });
});
