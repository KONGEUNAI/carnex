$(function(){
	var burger = $('#trigger');

	burger.each(function(index){
		var $this = $(this);

		$this.on('click', function(e){
			e.preventDefault();
			$(this).toggleClass('active-' + (index+1));
		});
	});

	$('#trigger').click(function(event){
		event.preventDefault();
		$(this).toggleClass('active');
		$('#menu').toggleClass('active');
	});

	$(function(){
		$(".menu-list > li > a").click(function(){
			$(this).parent().siblings().children().next().removeClass('sub-click');
			$(this).next().toggleClass('sub-click');
		});
	});


	$(function(){
        Splitting();
        ScrollOut();
	});
});
