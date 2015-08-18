$(document).ready(function() {
  $('.player').hide();
  $('.icon-4x').click(function(){
    $('.player').fadeIn("slow");
  });
  $('.menu-link').click(function(){
    $('.active').removeClass('active');
    $(this).addClass('active');
  });
  //matchHeight
  $(function() {
    $('.box-height').matchHeight();
  });
  // mobile menu
  $('.menu-button, ul a').click(function(){
    $('ul').toggleClass('show-menu');
    $('.menu-button').toggleClass('menu-open');
    $('.menu-button').toggleClass('menu-close');
  });

// avoids scroll-capture for map
  $(function() {
      $('.contact-box').click(function() {
          $(this).find('iframe').css('pointer-events', 'all');
      }).mouseleave(function() {
          $(this).find('iframe').css('pointer-events', 'none');
      });
  });

  //shows menu after scrolling
  $(document).scroll(function() {
    var y = $(this).scrollTop();

    if (y > 275) {
      $('.top-bar').removeClass('is-hidden').addClass('is-showing');
      $('nav').removeClass('is-hidden').addClass('is-showing');
    } else {
      $('.top-bar').removeClass('is-showing').addClass('is-hidden');
      $('nav').removeClass('is-showing').addClass('is-hidden');
    }
  });
  //includes navbar into any pages
  $(function() {
    $('#includeNav').load('nav.html');
  });
});
