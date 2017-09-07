$(document).ready(function() {
  $('.commenti').click(function() {
    $('.popup').css({'top': $(window).scrollTop() +100}).addClass('active');
    $('.bg-popup').fadeIn();
    $('.bg-popup').click(function() {
      $('.popup').removeClass('active');
      $('.bg-popup').fadeOut();
    });
  });

  $('.new').click(function() {
    $('.popup').css({'top': $(window).scrollTop() +100}).addClass('active');
    $('#new-autoservice').css({'display': 'unset'});
    $(window).scrollTop(0);
    $('.bg-popup').fadeIn();
    $('.bg-popup').click(function() {
      $('.popup').removeClass('active');
      $('.bg-popup').fadeOut();
      $('#new-autoservice').css({'display': 'none'});
    });
  });
});