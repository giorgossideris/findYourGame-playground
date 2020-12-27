let sort_types = document.getElementsByClassName("sort-type");
for (let i=0; i<sort_types.length; i++){
    sort_types[i].onclick = use_sort_type;
}

function use_sort_type(){
    if (document.getElementsByClassName("game").length > 0){
        sort_games(this.dataset.sortValue);
    }
}

function sort_games(sort_type){
    let games = [].slice.call(document.getElementsByClassName("game")); //convert games to array
    if (sort_type=="0"){
        games.sort(function(a, b){
            if(a.dataset.gameName < b.dataset.gameName){ return -1; }
            if(a.dataset.gameName > b.dataset.gameName){ return 1; }
            return 0;
        });
    }else if (sort_type=="1"){
        games.sort(function(a, b){
            if(parseInt(a.dataset.gameFavoritesCounter) < parseInt(b.dataset.gameFavoritesCounter)){ return -1; }
            if(parseInt(a.dataset.gameFavoritesCounter) > parseInt(b.dataset.gameFavoritesCounter)){ return 1; }
            return 0;
        });
        games.reverse();
    }else if (sort_type=="2"){
        games.sort(function(a, b){
            if(parseInt(a.dataset.gameRating) < parseInt(b.dataset.gameRating)){ return -1; }
            if(parseInt(a.dataset.gameRating) > parseInt(b.dataset.gameRating)){ return 1; }
            return 0;
        });
        games.reverse();
    }
    clear_children_from_node("#games-to-show");
    let games_to_show = document.getElementById("games-to-show");
    for(let i=0; games.length; i++){
        games_to_show.appendChild(games[i]);
    }


}

function clear_children_from_node(querySelector){
    const myNode = document.querySelectorAll(querySelector);
    while (myNode.lastElementChild) {
        myNode.removeChild(myNode.lastElementChild);
    }

}
