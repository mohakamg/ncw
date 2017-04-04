$(document).ready(function(){
  $('.inner-form-no-bg').animate({
    opacity: 1
  }, 1000, "linear");

  // for(var i=0;i<$('.card').length;i++){
  //     $("#teacher-card-" + (i+1).toString()).animate({
  //       opacity: 1
  //     }, 1000, "linear");
  //   }



  (function theLoop (i) {
  setTimeout(function () {

    $("#teacher-card-" + (i).toString()).animate({
      opacity: 1
    }, 1000, "linear");

    if (--i) {
      theLoop(i);
    }
  }, 500);
})($('.card-border').length);


});
