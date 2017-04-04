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

    if (--i) {          // If i > 0, keep going
      theLoop(i);       // Call the loop again, and pass it the current value of i
    }
  }, 500);
})($('.card').length);

});
