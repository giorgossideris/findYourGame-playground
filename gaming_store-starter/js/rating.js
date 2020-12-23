let stars = document.getElementById("stars").children;
for (var i = 0; i < stars.length; i++){
    stars[i].onmouseenter = star_hovered;
    stars[i].onmouseleave = star_unhovered;
    stars[i].onclick = star_clicked;
}

function star_hovered() {
    if (document.getElementById("stars").dataset.isRated == "false"){
        fill_stars(this);
    }
}

function star_unhovered() {
    if (document.getElementById("stars").dataset.isRated == "false"){
        if (document.getElementById("stars").dataset.isRated == "false"){
            empty_stars(this);
        }
    }
}

function star_clicked() {
    if (document.getElementById("stars").dataset.isRated == "false"){
        let userId = document.getElementsByTagName("html")[0].dataset.userId;
        if (userId == "null"){
            location.href = "./login.jsp?message=Only registered users can rate! Please login.";
        } else {
            let rating = this.dataset.starId, //starIds start from 1
                gameId = document.getElementsByTagName("html")[0].dataset.gameId;
            document.getElementById("stars").dataset.isRated = "true";
            fill_stars(this);
            $.post("./ratingController.jsp", { game_id: gameId, user_id: userId, rating: rating});
        }
    }
}

function fill_stars(star){ // star is the last star we want to fill
    for (var i = 0; i < stars.length; i++){
        stars[i].getElementsByTagName("svg")[0].setAttribute("class", "bi bi-star-fill");
        stars[i].getElementsByTagName("path")[0].setAttribute("d", "M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z");
        if (stars[i] == star) {
            break;
        }
    }
}

function empty_stars(star){ // star is the last star we want to empty
    for (var i = 0; i < stars.length; i++){
        stars[i].getElementsByTagName("svg")[0].setAttribute("class", "bi bi-star");
        stars[i].getElementsByTagName("path")[0].setAttribute("d", "M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288l1.847-3.658 1.846 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.564.564 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z");
        if (stars[i] == star) {
            break;
        }
    }
}