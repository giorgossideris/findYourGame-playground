let sort_types = document.getElementsByClassName("sort-type");
for (let i=0; i<sort_types.length; i++){
    sort_types[i].onclick = use_sort_type;
}

function use_sort_type(){
    $.post("./sortingController.jsp", { eidos_sort: this.dataset.sortValue});
}