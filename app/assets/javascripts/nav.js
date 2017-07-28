$(window).on("scroll", function () {
    if ($(document).scrollTop() > 50) {
        $('.invert-on-scroll').addClass('inverted navbar-light');
        $('.invert-on-scroll').removeClass('navbar-inverse bg-inverse');
    } else {
        $('.invert-on-scroll').removeClass('inverted navbar-light');
        $('.invert-on-scroll').addClass('navbar-inverse bg-inverse');
    }
});
