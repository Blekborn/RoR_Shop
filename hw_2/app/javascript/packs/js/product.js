document.addEventListener("turbolinks:load", function() {
    $input = $('*[data-behavior="autocomplete"]')
    let options = {
        url: function(phrase) {
            return "/product/search.json?q=" + phrase;
        },
        getValue: "name",
    };
    $input.easyAutocomplete(options);
});