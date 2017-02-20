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

