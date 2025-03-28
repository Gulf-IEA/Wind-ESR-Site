$(document).ready(function () {
  $(".scroll-section").scrollex({
    enter: function () {
      $(this).addClass("visible");
    },
    leave: function () {
      $(this).removeClass("visible");
    },
  });
});
