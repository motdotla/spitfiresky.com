// $(document.body).click(function () {
//    if ($("div:first").is(":hidden")) {
//      $("div").slideDown("slow");
//    } else {
//      $("div").hide();
//    }
//  });

$(document).ready(function(){
 // hide articles
 var articles = $('#articles');
 articles.hide();
 
 // toggle articles on click
 $("#show_articles").click(function () {
   articles.slideToggle();
 });
});


// // sammy app
// var app = $.sammy(function() { with(this) {
//   // Hide articles
//   $("#articles").hide();
//   
//   // debug on
//   debug = true
//   
//   // articles
//   get('#/articles', function() { with(this) {
//     console.log('worked!');
//     $('#articles').slideDown();
//   }});
//   
// }});
// $(function() {
//   app.run();
// });
