$(document).ready(function(){
 // hide articles
 var articles = $('#articles');
 articles.hide();
 
 // toggle articles on click
 $(".show_articles").click(function () {
   articles.slideToggle();
 });
 
 	// tweet plugin
	$(".tweets").tweet({
		username: "spitfiresky",
		count: 1,
		loading_text: "loading tweet"
	});
});
