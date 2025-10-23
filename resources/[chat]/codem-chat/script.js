
    (function() {
        var exist = document.getElementsByClassName('left-curved');
   
        if (exist.length > 0) {
            return
        }
        document.querySelector(".chat-input textarea").placeholder = "/Tulis Di Sini";
        
        const leftCurved = document.createElement("img");
        const rightCurved = document.createElement("img");
        const console = document.createElement("img");
        
        leftCurved.setAttribute("src", "https://cdn.discordapp.com/attachments/1320755950511980577/1430583324639887584/Sol-Alt.png?ex=68fa4e0b&is=68f8fc8b&hm=1163d16c2fe2340c788da6c5eb918e91290784f45a216aaa679390f2c56a63f3&");
        rightCurved.setAttribute("src", "https://cdn.discordapp.com/attachments/1320755950511980577/1430583470735753350/Sag-Ust.png?ex=68fa4e2e&is=68f8fcae&hm=02f2799254ecd4d468ba43ba59ab1b261f3f7e001d5af525ff6a580a84f24046&");
        console.setAttribute("src", "https://cdn.discordapp.com/attachments/1320755950511980577/1430585266799644692/CONSOLE.png?ex=68fa4fda&is=68f8fe5a&hm=be19071edfb7c07557f65abd94de2f7d1ce502b551872d898d2cdd0adec3620f&");
        
        leftCurved.classList.add("left-curved");
        rightCurved.classList.add("right-curved");
        console.classList.add("console");

        document.querySelector(".chat-input textarea").parentElement.style.position = "relative"
        document.querySelector(".chat-input textarea").parentElement.style.width = "449px"

        document.querySelector(".chat-input textarea").parentElement.appendChild(leftCurved);
        document.querySelector(".chat-input textarea").parentElement.appendChild(rightCurved);
        document.querySelector(".chat-input textarea").parentElement.appendChild(console);


    })();
