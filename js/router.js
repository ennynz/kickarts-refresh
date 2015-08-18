riot.route(function(collection, id, action) {
  if(collection === "our-team") {
    $('.active').removeClass('active');
    $('.our-team-link').addClass('active');
    $('footer').hide();
    $('#header').hide();
    $('#our-team-section').fadeIn();
    $('html,body').animate({scrollTop: $('#our-team').offset().top }, 500);
    $(document).scroll(function() {
      var y = $(this).scrollTop();
      if (y < 20) {
        $('#header').fadeIn();
        $('#our-team-section .padding-top').hide();
      };
    });
  }else{
    $('#our-team-section').hide();
  };
  if(collection === "contact") {
    $('.active').removeClass('active');
    $('.contact-link').addClass('active');
    $('#header').hide();
    $('footer').fadeIn();
    $('#contact-section').fadeIn();
    $('html,body').animate({scrollTop: $('#contact').offset().top -100}, 500);
    $(document).scroll(function() {
      var y = $(this).scrollTop();
      if (y < 20) {
        $('#header').fadeIn();
        $('#contact-section .padding-top').hide();
      };
    });
  }else{
    $('#contact-section').hide();
  };
  if(collection === "header") {
    $('.active').removeClass('active');
    $('.home-link').addClass('active');
    $('#header').fadeIn();
    $('footer').fadeIn();
    $('html,body').animate({scrollTop: $('#header').offset().top -100}, 500);
  };
});
