//= require jquery
//= require popper
//= require bootstrap
//= require_tree .

$(function() {
  $('.slider').slick({
      autoplay: true,
      autoplaySpeed: 2000,
      fade: true,
      arrows: false,
  });
});