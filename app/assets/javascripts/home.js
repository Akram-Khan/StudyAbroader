
$(document).ready(function() {
     $('.signupButtonForModal').click(function(e) {
          e.preventDefault();
      $('.signupModal').reveal();
     });
});


$(document).ready(function() {
     $('.signinButtonForModal').click(function(e) {
          e.preventDefault();
      $('.signinModal').reveal();
     });
});

$(function(){
       $("a").each(function(){
               if ($(this).attr("href") == window.location.pathname){
               			$(".nav-bar li a").removeClass("active")
                       $(this).addClass("active");
               }
       });
});