// (function() {
//   var mainElement = document.getElementById("main");
//   var content1Element = document.getElementById("content1");
//   var content2Element = document.getElementById("content2");
//   var contentTimerElement = document.getElementById("contentTimer");
//   var content3Element = document.getElementById("content3");

//   var countdownInterval;

//   mainElement.style.display = "none";

//   window.addEventListener("message", function(event) {
//       if (event.data.action === "open") {
//           mainElement.style.display = "block";
//           content2Element.style.display = (event.data.content === undefined) ? "none" : "block";
//           content1Element.innerHTML = event.data.title;
//           content2Element.innerHTML = event.data.content;

//           if (event.data.timerDuration !== undefined) {
//               clearInterval(countdownInterval);
//               contentTimerElement.style.display = "block";
//               var remaining = event.data.timerDuration;

//               countdownInterval = setInterval(function() {
//                   var minutes = Math.floor(remaining / 60);
//                   var seconds = remaining % 60;
//                   contentTimerElement.innerHTML = minutes + " MENIT " + (seconds < 10 ? "0" : "") + seconds + " DETIK";

//                   remaining--;
//                   if (remaining < 0) {
//                       clearInterval(countdownInterval);
//                       contentTimerElement.innerHTML = "";
//                       contentTimerElement.style.display = "none";
//                       $('#main').animate({ 'margin-left': '-30%' });
//                       setTimeout(function() {
//                           mainElement.style.display = "none";
//                           content1Element.innerHTML = "";
//                           content2Element.innerHTML = "";
//                       }, 1000);
//                   }
//               }, 1000);
//           } else {
//               contentTimerElement.style.display = "none";
//           }

//           $('#main').animate({ 'margin-left': '-5%' });
//       } else if (event.data.action === "close") {
//           clearInterval(countdownInterval);
//           $('#main').animate({ 'margin-left': '-30%' });
//           setTimeout(function() {
//               mainElement.style.display = "none";
//               content1Element.innerHTML = "";
//               content2Element.innerHTML = "";
//               contentTimerElement.innerHTML = "";
//               contentTimerElement.style.display = "none";
//           }, 1000);
//       }
//   });
// })();


(function() {
    var mainElement = document.getElementById("main");
    var content1Element = document.getElementById("content1");
    var content2Element = document.getElementById("content2");
    var content3Element = document.getElementById("content3");
    var contentTimerElement = document.getElementById("contentTimer");

    var countdownInterval;

    mainElement.style.display = "none";

    window.addEventListener("message", function(event) {
        if (event.data.action === "open") {
            mainElement.style.display = "block";

            // Set isi title dan content
            content1Element.innerHTML = event.data.title || "";
            // content2Element.innerHTML = event.data.content || "";
            if (event.data.content) {
    const lines = event.data.content.split("\n");
    content2Element.innerHTML = `
        <div style="text-transform: uppercase; font-weight: bold; font-size: 20px;">${lines[0]}</div>
        <div style="font-weight: normal; font-size: 14px;">${lines[1] || ""}</div>
    `;
} else {
    content2Element.innerHTML = "";
}
            content3Element.innerHTML = event.data.content3 || "";

            // Atur tampil/tidak tampil
            content2Element.style.display = event.data.content ? "block" : "none";
            content3Element.style.display = event.data.content3 ? "block" : "none";

            // Timer logic
            if (event.data.timerDuration !== undefined) {
                clearInterval(countdownInterval);
                contentTimerElement.style.display = "block";
                var remaining = event.data.timerDuration;

                countdownInterval = setInterval(function() {
                    var minutes = Math.floor(remaining / 60);
                    var seconds = remaining % 60;
                    contentTimerElement.innerHTML = minutes + " MINUTE " + (seconds < 10 ? "0" : "") + seconds + " SECOND";

                    remaining--;
                    if (remaining < 0) {
                        clearInterval(countdownInterval);
                        contentTimerElement.innerHTML = "";
                        contentTimerElement.style.display = "none";
                        $('#main').animate({ 'margin-left': '-30%' });
                        setTimeout(function() {
                            mainElement.style.display = "none";
                            content1Element.innerHTML = "";
                            content2Element.innerHTML = "";
                            content3Element.innerHTML = "";
                        }, 1000);
                    }
                }, 1000);
            } else {
                contentTimerElement.style.display = "none";
            }

            $('#main').animate({ 'margin-left': '-5%' });
        } else if (event.data.action === "close") {
            clearInterval(countdownInterval);
            $('#main').animate({ 'margin-left': '-30%' });
            setTimeout(function() {
                mainElement.style.display = "none";
                content1Element.innerHTML = "";
                content2Element.innerHTML = "";
                content3Element.innerHTML = "";
                contentTimerElement.innerHTML = "";
                contentTimerElement.style.display = "none";
            }, 1000);
        }
    });
})();
