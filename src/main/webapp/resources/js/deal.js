$(function(){
    $('#js_version').liteAccordion({
        theme : 'dark', 
        rounded : true, 
        enumerateSlides : true,
        firstSlide : 1,
        linkable : true,
        easing : 'easeOutBounce'
    });

    $(".owl-carousel").owlCarousel({
        loop: true,
        nav: true,
        responsiveClass: false,
        responsive: {
            0: {items:1},
            759: {items:1}
        }
    });
});