riot.route(function(e,t,o){"our-team"===e?($(".active").removeClass("active"),$(".our-team-link").addClass("active"),$("#our-team-section").fadeIn(function(){$("html,body").animate({scrollTop:$("#our-team").offset().top-25},500)})):$("#our-team-section").hide(),"contact"===e?($(".active").removeClass("active"),$(".contact-link").addClass("active"),$("#contact-section").fadeIn(function(){$("html,body").animate({scrollTop:$("#contact").offset().top-25},500)})):$("#contact-section").hide(),"search"===e?($(".active").removeClass("active"),$(".search-link").addClass("active"),$("#search-section").fadeIn(function(){$("html,body").animate({scrollTop:$("#search").offset().top},500)})):$("#search-section").hide(),"episodes"===e?($(".active").removeClass("active"),$(".episodes-link").addClass("active"),$("#episodes-section").fadeIn(function(){$("html,body").animate({scrollTop:$("#episodes").offset().top-125},500)})):$("#episodes-section").hide(),"home"===e&&($(".active").removeClass("active"),$(".home-link").addClass("active"),$("#home").fadeIn(function(){$("html,body").animate({scrollTop:$("#home").offset().top},500)}))});