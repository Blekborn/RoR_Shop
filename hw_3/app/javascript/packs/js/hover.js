document.addEventListener('turbolinks:load', function () {
    if ( window.location.pathname.includes("categories") ) {
        let url = window.location.href;

        function getCategoryId(url) {
            return url.match(/\/(\d+)+[\/]?/g).map(id => id.replace(/\//g, ''))[0];
        }

        let cId = getCategoryId(url);

        $("#"+cId).css({'color': 'white', 'background-color': 'black'});
    }
});