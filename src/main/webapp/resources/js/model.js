
$(function() {
  $('.flexslider').flexslider({
    animation: "slide" /*fade*/
  });
});
$(function(){
        $(".owl-carousel").owlCarousel({
            loop: true, 
            nav: true,
            responsiveClass: true,
            responsive: { //반응형: (미디어쿼리)중단점에 따른 설정 
                0: {items:1},
                700: {items:2}, //margin 안넣음
                1000: {
                    items:3,
                    nav: true,
                    loop: true,
                    margin: 20
                }, //margin 넣음
                1400: {
                    items:3, //여백은 3개 
                    nav: true,
                    loop: true,
                    margin: 50
                }
            }
        });
    });