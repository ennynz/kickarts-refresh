$(document).ready(function() {
  $('.player').hide();
  $('.icon-4x').click(function(){
    $('.player').fadeIn("slow");
  });
  $('.menu-link').click(function(){
    $('.active').removeClass('active');
    $(this).addClass('active');
  });
  $(function() {
    $('.box-height').matchHeight();
  });
});
