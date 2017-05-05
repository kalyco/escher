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

// $(document).ready(function () {
//     $('a.sun_and_moon').on('hover', function () {
//         var image = $(this).attr('img');
//         //alert(image);
//         $('#myModal').on('show.bs.modal', function () {
//             $(".showimage").attr("src", image);
//         });
//     });
// });