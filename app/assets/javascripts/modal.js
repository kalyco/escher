/* Set the width of the side navigation to 250px */
function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
}

/* Set the width of the side navigation to 0 */
function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}

// Close any share modal when escape key is pressed
$(document).keyup(function(e) {
  if ($("#mySidenav").is(":visible")) {
  	if (e.keyCode == 27) {
    	e.preventDefault();
    	hideAllModals();
  	}
  }
});


// Hide any open modals
function hideAllModals() {
  $('.toggle-menu').click();
}

$(".toggle-search").click(function(){
  $(".search-nav").toggleClass("is-active", 350);
  $(".main-nav").addClass("is-hidden", 350);
});


$(".close-search").click(function(){
  $(".search-nav").removeClass("is-active", 350);
  $(".main-nav").removeClass("is-hidden", 350);
});

$(function() {
  $(".toggle_circle_limit").click(function() {
    $('.circle_modal').fadeIn(1000);
    $('.box').addClass('custom-overlay');
    $('.box').off('mouseenter mouseleave');
    $('.box').off('before after');
    $('#close_circle').fadeIn(1000);
    $('#close_circle').on('mouseenter mouseleave');
    $('#close_circle').on('before after');

  });
});

$(function() {
  $("#circle_remove").click(function() {
    $('.circle_modal').fadeOn(1000, 0);
    $('.box').removeClass('custom-overlay');
    $('.box').on('mouseenter mouseleave');
    $('.box').on('before after');
    $('#close_circle').off('mouseenter mouseleave');
    $('#close_circle').off('before after');
  });
});
