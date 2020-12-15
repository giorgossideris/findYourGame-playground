$.post("./favoriteController.jsp", { name: "John", time: "2pm" });
var heart_icons = document.querySelectorAll('.heart-icon');
    for (var i = 0; i < heart_icons.length; i++){
        heart_icons[i].onclick = heart_pressed;
}
function heart_pressed() {
    let heart_icon = this,
        style = window.getComputedStyle(heart_icon),
        heart_image = style.getPropertyValue('background-image');
    if (this.dataset.isFavorite == "false"){  // if the game is not favorite make the heart pink
        this.style.backgroundImage = 'url("./images/heart.svg")';
        this.dataset.isFavorite = "true";
    } else { // else (if the game is not favorite) make the heart black
        this.style.backgroundImage = 'url("./images/black-heart.svg")';
        this.dataset.isFavorite = "false";
    }
}