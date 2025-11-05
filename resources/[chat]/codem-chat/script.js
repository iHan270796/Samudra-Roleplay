
(function () {
    var exist = document.getElementsByClassName('left-curved');
    if (document.getElementsByClassName('prefix').length > 0) {
        const elements = document.getElementsByClassName('prefix');
        while (elements.length > 0) {
            elements[0].parentNode.removeChild(elements[0]);
        }
    }
    if (exist.length > 0) {
        return
    }
    document.querySelector(".chat-input textarea").placeholder = "/type commands in here";

    const leftCurved = document.createElement("img");
    const rightCurved = document.createElement("img");
    const console = document.createElement("img");

    leftCurved.setAttribute("src", "https://r2.fivemanage.com/8Hb4twhFSbaNdR27bPGV4/OOC-LEFT.png");
    rightCurved.setAttribute("src", "https://r2.fivemanage.com/8Hb4twhFSbaNdR27bPGV4/OOC-RIGHT.png");
    console.setAttribute("src", "https://r2.fivemanage.com/8Hb4twhFSbaNdR27bPGV4/Console.png");

    leftCurved.classList.add("left-curved");
    rightCurved.classList.add("right-curved");
    console.classList.add("console");

    document.querySelector(".chat-input textarea").parentElement.style.position = "relative"
    document.querySelector(".chat-input textarea").parentElement.style.width = "449px"

    document.querySelector(".chat-input textarea").parentElement.appendChild(leftCurved);
    document.querySelector(".chat-input textarea").parentElement.appendChild(rightCurved);
    document.querySelector(".chat-input textarea").parentElement.appendChild(console);


})();
