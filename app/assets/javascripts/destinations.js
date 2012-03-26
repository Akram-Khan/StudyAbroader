$(document).ready(function(){
	$('.country_name').hide();
	$('.city_name').hide();
	$('li').click(function() {
       if ($(this).next('ul').is(':visible')){
           $(this).next('ul').hide();
            
       } else {
             $(this).next('ul').show();
              
        }
	    //$(this).next('ul').toggle();
	});

	 $(window).load(function() {
         $('#featured').orbit({
         	bullets:true,
         	captions: true,
          timer: true,
          animationSpeed: 1000,
          advanceSpeed: 5000,
         	captionAnimation: 'fade',
         	captionAnimationSpeed: 800
         });
     });   
});