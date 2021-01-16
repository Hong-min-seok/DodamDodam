
$(function() {

	$(".accordion_title").on('click', function() {
		$(this).next(".con").slideToggle(100);
	});

	$(".sideopen").click(function() {
		$("#sidemenu,.page_cover,html").addClass("open");
		window.location.hash = "#open";
	});

	window.onhashchange = function() {
		if (location.hash != "#open") {
			$("#sidemenu,.page_cover,html").removeClass("open");
		}
	};
	$(".sideclose").click(function() {
		$("#sidemenu").removeClass("open");
		$("#sidemenu,.page_cover,html").removeClass("open");
	});


});

$(function() {
	$(window).scroll(function() {
		if ($(this).scrollTop() > 500) {
			$('#MOVE_TOP_BTN').fadeIn();
		} else {
			$('#MOVE_TOP_BTN').fadeOut();
		}
	});

	$("#MOVE_TOP_BTN").click(function() {
		$('html, body').animate({
			scrollTop: 0
		}, 400);
		return false;
	});
});
