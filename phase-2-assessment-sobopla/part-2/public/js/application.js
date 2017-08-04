$(document).ready(function(){
  // NEW POST HANDLER
  $("#new-post-form").submit(function(event){
    event.preventDefault();
    var form = $(this);
    

    $.ajax({
      url: form.attr('action'),
      type: form.attr('method'),
      data: form.serialize()
    })
    .done(function(response){
      $("#post-list").prepend(response);
    })
  })

  //LIKE POST HANDLER
  $(".post-list").on("click", ".like-submit", function(event) {
    event.preventDefault();
    var $vote = $(this);
    // debugger
    var foundform = $(this).closest("form");

    $.ajax({
      url: foundform.attr('action'),
      method: foundform.attr('method')
    })
    .done(function (dataReturn) {
      myJson = JSON.parse(dataReturn)
      $(foundform).closest("post-detail").find(".likes").text(myJson.likes_count);
    })
  })

})


// $(".post-container").on("click", ".vote-button", function (event) {
//   event.preventDefault();
//   var $arrow = $(this)
//   var foundform = $(this).closest("form");

//   $.ajax({
//     url: foundform.attr('action'),
//     method: foundform.attr('method'),
//   })
//     .done(function (dataReturn) {
//       myJson = JSON.parse(dataReturn)
//       $(foundform).closest("article").find(".points").text(myJson.points);
//       $arrow.css("color", "red");
//     })
// })
