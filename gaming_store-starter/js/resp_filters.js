window.addEventListener('resize', filters_at_resize);
window.onload = filters_at_resize;
function filters_at_resize(){
    let filter_area = document.querySelector('.filter-area');
    if (window.innerWidth > 900) {
        filter_area.style.display = "flex";
        document.getElementById('show-filters-button').innerText = "Show filters";
        document.querySelector('.games-to-navigate-area').style.gridColumn="2/3";
    }else{
        filter_area.style.display = "none";
        document.getElementById('show-filters-button').innerText = "Show filters";
        document.querySelector('.games-to-navigate-area').style.gridColumn="1/3";
    } 
};

let filter_button = document.getElementById(show-filters-button);
filter_button.click(function() {
    let filter_area = document.querySelector('.filter-area'),
        style = window.getComputedStyle(filter_area),
        display = style.getPropertyValue('display');
    if (display == 'none'){
        filter_area.css({
            'display': 'flex',
        });
        document.getElementById('show-filters-button').innerText = "Hide filters";
    } else {
        filter_area.css({
            'display': 'none',           
        });
        document.getElementById('show-filters-button').innerText = "Show filters";
    }
});

