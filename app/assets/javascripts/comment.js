$(document).ready(function() {
  $("#comment").click(function() {
    $('.popup').css({'top': $(window).scrollTop() +100}).addClass('active');
    $('.bg-popup').fadeIn();
    $('.bg-popup').click(function() {
      $('.popup').removeClass('active');
      $('.bg-popup').fadeOut();
    });
  });
});