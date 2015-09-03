// Customize bourbon gif class (from http://codepen.io/CalebGrove/pen/bIsqy)
$(document).ready(function() {
    $(".gif-hover").hover(
        function() {
            var src = $(this).attr("src");
            $(this).attr("src", src.replace(/\.png$/i, ".gif"));
        },
        function() {
            var src = $(this).attr("src");
            $(this).attr("src", src.replace(/\.gif$/i, ".png"));
        });
    function swap_to_gif() {
        var src = $(this).attr("src");
        $(this).attr("src", src.replace(/\.png$/i, ".gif"));
        $(this).one("click", swap_to_png);
    }
    function swap_to_png() {
        var src = $(this).attr("src");
        $(this).attr("src", src.replace(/\.gif$/i, ".png"));
        $(this).one("click", swap_to_gif);
    }
    $(".gif-click").one("click", swap_to_gif);
});
