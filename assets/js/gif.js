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
  function handler1() {
    var src = $(this).attr("src");
    $(this).attr("src", src.replace(/\.png$/i, ".gif"));
    $(this).one("click", handler2);
  }
  function handler2() {
    var src = $(this).attr("src");
    $(this).attr("src", src.replace(/\.gif$/i, ".png"));
    $(this).one("click", handler1);
  }
  $(".gif-click").one("click", handler1);
});
