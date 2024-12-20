$(function() {
	const animationOptions = {
    ease: 'expo.inOut'
}

const introAnimation = () => {
    const tl = gsap.timeline({
        defaults: {
            ease: animationOptions.ease,
            duration: 1,
        }
    });
    
    tl.to('.intro-title', {
        duration: 1.5,
        y: 0,
        autoAlpha: 1,
        delay: 0.5,
    })
    .to('.intro-background-left, .intro-background-right', {
        scaleX: 1,
    })
    .to('.intro-background-left, .intro-background-right', {
        scaleY: 0,
        transformOrigin: 'top center',
    })
    .to('.intro-title', {
        duration: 1.5,
        y: -60,
        autoAlpha: 0,
    }, '-=0.6')
    .to('.intro', {
        y: '-100%',
    }, '-=0.5')
    
    return tl;
}

const skewInElements = elements => {
    const tl = gsap.timeline();

    tl.from(elements, {
        duration: 1,
        ease: animationOptions.ease,
        skewY: -5,
        autoAlpha: 0,
        y: 40,
    })
		
    return tl;
}

const fadeInElements = elements => {
    const tl = gsap.timeline();
    
    tl.from(elements, {
        duration: 1,
        ease: animationOptions.ease,
        y: '20px',
        autoAlpha: 0,
        stagger: 0.1,
    })
    
    return tl;
}

const master = gsap.timeline({
    paused: false,
    delay: 0.2,
});

master
    .add(introAnimation())
});

$(document).ready(function(){
	$("#demosMenu").change(function(){
	  window.location.href = $(this).find("option:selected").attr("id") + '.html';
	});
});

$(function() {
	$('#fullpage').fullpage({
		sectionsColor: ['#333', '#333'],
		anchors: ['firstPage', 'secondPage'], 
		menu: '#menu',
		scrollingSpeed: 1000 
	});
});

$(function(){
	$('.fp-wrap-1').vegas({
		slides: [
			{
				video: {
					src: '/resources/video/index-video.mp4',
					loop: true,
					mute: true
				}
			}
		],
		delay: 5500
	}); 
});

$(function () {
	$('.tlt-1').textillate({
		selector: '.texts',
		loop: false,
		minDisplayTime: 2000,
		initialDelay: 2600,
		autoStart: true,
		inEffects: [],
		outEffects: [ 'hinge' ],

		in: {
			effect: 'fadeInLeftBig',
			delayScale: 1.5,
			delay: 50,
			sync: false,
			shuffle: false,
			reverse: false,
			callback: function () {}
		},

		callback: function () {},
		type: 'char'
	});
})

$(function () {
	$('.tlt-2').textillate({
		selector: '.texts',
		loop: false,
		minDisplayTime: 2000,
		initialDelay: 2800,
		autoStart: true,
		inEffects: [],
		outEffects: [ 'hinge' ],

		in: {
			effect: 'fadeInLeftBig',
			delayScale: 1.5,
			delay: 50,
			sync: false,
			shuffle: false,
			reverse: false,
			callback: function () {}
		},

		callback: function () {},
		type: 'char'
	});
})

$(function () {
	$('.tlt-3').textillate({
		selector: '.texts',
		loop: false,
		minDisplayTime: 2000,
		initialDelay: 3000,
		autoStart: true,
		inEffects: [],
		outEffects: [ 'hinge' ],

		in: {
			effect: 'fadeInLeftBig',
			delayScale: 1.5,
			delay: 50,
			sync: false,
			shuffle: false,
			reverse: false,
			callback: function () {}
		},

		callback: function () {},
		type: 'char'
	});
})

$(function () {
	$('.tlt-4').textillate({
		selector: '.texts',
		loop: false,
		minDisplayTime: 2000,
		initialDelay: 3200,
		autoStart: true,
		inEffects: [],
		outEffects: [ 'hinge' ],

		in: {
			effect: 'fadeInLeftBig',
			delayScale: 1.5,
			delay: 50,
			sync: false,
			shuffle: false,
			reverse: false,
			callback: function () {}
		},

		callback: function () {},
		type: 'char'
	});
})

// =============
$(function(){
  const observer = new IntersectionObserver(
    (entries, observer) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          entry.target.classList.add("fade-in");
        } else {
          entry.target.classList.remove("fade-in");
        }
      });
    },
    { threshold: 1 }
  );

  const targetElements = document.querySelectorAll(".fade-wrap-1, .fade-wrap-2, .fade-wrap-3");
  targetElements.forEach((element) => {
    observer.observe(element);
  });
});

