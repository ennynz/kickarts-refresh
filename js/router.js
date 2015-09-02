riot.route(function(collection, id, action) {
  // TEAM
  if(collection === "our-team") {
    $('#contact-section').hide();
    $('#episodes-section').hide();
    $('#our-team-section').fadeIn(function() {
      $('html,body').animate({scrollTop: $('#our-team').offset().top -10}, 500);
    });
  }else{
    $('#our-team-section').hide();
  }
  // CONTACT
  if(collection === "contact") {
    $('#our-team').hide();
    $('#episodes-section').hide();
    $('#contact-section').fadeIn(function() {
      $('html,body').animate({scrollTop: $('#contact').offset().top -25}, 500);
    });
  }else{
    $('#contact-section').hide();
  }
  // SEARCH
  if(collection === "search") {
    $('#our-team').hide();
    $('#episodes-section').hide();
    $('#search-section').fadeIn(function() {
      $('html,body').animate({scrollTop: $('#search').offset().top }, 500);
    });
  }else{
    $('#search-section').hide();
  }
  // EPISODES
  if(collection === "episodes") {
    $('#our-team').hide();
    $('#episodes-section').fadeIn(function() {
      $('html,body').animate({scrollTop: $('#episodes').offset().top -125}, 500);
    });
  }
  // EPISODE-LIST
  if(collection === "episodes-list") {
    $('#our-team').hide();
    $('#episodes-section').hide();
    $('#episodes-list-section').fadeIn(function() {
      $('html,body').animate({scrollTop: $('#episodes-list').offset().top -125}, 500);
    });
  }else{
    $('#episodes-list-section').hide();
  }
  // HOME
  if(collection === "home") {
    $('.active').removeClass('active');
    $('.home-link').addClass('active');
    $('#episodes-section').fadeIn();
    $('html,body').animate({scrollTop: $('#home').offset().top }, 500);
  }
});
