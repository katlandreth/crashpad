$(document).ready(function(){
  $(".scroll_down").click(function () {
      var scroll_to = $(this).attr("href");
      $("html, body").animate({
          scrollTop: $(scroll_to).offset().top
      }, "slow");
      return false;
  });
});
