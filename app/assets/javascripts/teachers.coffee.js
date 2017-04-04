$(document).ready(function(){
  $('.inner-form-no-bg').animate({
    opacity: 1
  }, 1000, "linear");

  for(var i=0;i<$('.card').length;i++){
    setTimeout(function() {
      $("#teacher-card-" + (i+1).toString()).animate({
        opacity: 1
      }, 1000, "linear");
    }
  }, 1000);
  //your code to be executed after 1 second

});
