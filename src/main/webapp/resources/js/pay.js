$(function () {
    $(".owl-carousel").owlCarousel({
        loop: true,
        nav: true,
        responsiveClass: true,
        responsive: {
            0: { items: 1 },
            760: { items: 1 },
            1050: {items: 1},
            1400: {
                items: 2,
                nav: true,
                loop: false,
                margin: -15,
            },
        },
    });

    $(window).scroll(function(){
        var height = $(window).scrollTop();
        console.log(height);

        if (height >= 500) {
            $('.pay-install-txt >h4').addClass('fade-in');
            $('.pay-install-txt >p').addClass('fade-in');
            $('.ins-btn').addClass('fade-in');
            $('.pay').addClass('fade-in');
        } 
        if (height >= 1100) {
            $('.pay-coc-item > h4').addClass('fade-in');
            $('.pay-coc-txt').addClass('fade-in');
            $('.coc-btn').addClass('fade-in');
        };
    });
});