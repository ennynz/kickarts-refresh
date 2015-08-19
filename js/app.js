$(document).ready(function() {
  $('#our-team-section').hide();
  $('#contact-section').hide();

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

    if (y > 200) {
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
  //dropdown
  function DropDown(el) {
  this.dd = el;
  this.placeholder = this.dd.children('span');
  this.opts = this.dd.find('ul.dropdown > li');
  this.val = '';
  this.index = -1;
  this.initEvents();
  }
  DropDown.prototype = {
    initEvents: function() {
      var obj = this;

      obj.dd.on('click', function(event) {
        $(this).toggleClass('active');
        return false;
      });

      obj.opts.on('click', function() {
        var opt = $(this);
        obj.val = opt.text();
        obj.index = opt.index();
        obj.placeholder.text(obj.val);
      });
    },
    getValue: function() {
      return this.val;
    },
    getIndex: function() {
      return this.index;
    }
  }

  $(function() {

    var dd = new DropDown($('#dd'));
    var dd2 = new DropDown($('#dd2'));
    var dd3 = new DropDown($('#dd3'));
    var dd4 = new DropDown($('#dd4'));
    $(document).click(function() {
      // all dropdowns
      $('.wrapper-dropdown-1').removeClass('active');
    });

  });
  //search form
  $('.name').on('blur', function(){
    if( $(this).val().length > 0 ){
      $(this).next().addClass('stay');
    } else {
      $(this).next().removeClass('stay');
    }
  });
});
