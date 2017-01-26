// toggle sliding search bar

$(function() {
	$("a.nav-search.js-toggle-search").click(function() {
		if ($(".search-nav_form").is(":visible")) {
			$(".search-nav_form").slideUp(".2s");
			$(".toggle-menu").slideDown(".2s");
			$(".search-close-bar").slideUp(".2s");
			$(".search-bar-icon").slideUp(".2s");
		} else {
			$(".search-bar-icon").hide();
			$(".search-nav_form").slideDown(".2s");
			$(".toggle-menu").slideUp(".2s");
			$(".search-close-bar").slideDown(".2s");
		}
	});
});

$(function() {
	$("a.search-close-bar.js-toggle-search").click(function() {	
		$(".search-close-bar").hide();
		$(".search-bar-icon").slideDown(".2s").delay(".2s");
		$(".search-nav_form").slideUp(".2s");
		$(".toggle-menu").slideDown(".2s");
	});
});
