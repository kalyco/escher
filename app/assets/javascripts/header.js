// toggle sliding search bar

$(function() {
	$("a.search-bar.js-toggle-search").click(function() {
		if ($("form.site-nav_form").is(":visible")) {
			$(".site-nav_form").slideUp(".2s");
			$(".toggle-menu").slideDown(".2s");
			$(".search-close-bar").slideUp(".2s");
			$(".search-bar-init").slideUp(".2s");
		} else {
			$(".search-bar-init").hide();
			$(".site-nav_form").slideDown(".2s");
			$(".toggle-menu").slideUp(".2s");
			$(".search-close-bar").slideDown(".2s");
		}
	});
});

$(function() {
	$("a.search-close-bar.js-toggle-search").click(function() {	
		$(".search-close-bar").hide();
		$(".search-bar-init").slideDown(".2s").delay(".2s");
		$(".site-nav_form").slideUp(".2s");
		$(".toggle-menu").slideDown(".2s");
	});
});
