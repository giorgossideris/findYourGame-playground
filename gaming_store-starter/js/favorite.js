var heart_icons = document.querySelectorAll('.heart-icon');
    for (var i = 0; i < heart_icons.length; i++){
        heart_icons[i].onclick = heart_pressed;
}
function heart_pressed() {
    let heart_icon = this,
        userId = document.getElementsByTagName("html")[0].dataset.userId;
    if (userId == "null"){
        location.href = "./login.jsp?message=Only registered users can add favorites! Please login.";
    }else if (this.dataset.isFavorite == "false"){  // if the game is not favorite make the heart pink
        this.style.backgroundImage = 'url("./images/heart.svg")';
        this.dataset.isFavorite = "true";
        $.post("./favoriteController.jsp", { game_id: this.dataset.gameId, user_id: userId, action: "add" });
    } else { // else (if the game is not favorite) make the heart black
        this.style.backgroundImage = 'url("./images/black-heart.svg")';
        this.dataset.isFavorite = "false";
        $.post("./favoriteController.jsp", { game_id: this.dataset.gameId, user_id: userId, action: "remove" });
    }
}