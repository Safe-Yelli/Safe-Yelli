// Preloader js
$(window).on('load', function () {
	$('.preloader').addClass('d-none');
});

(function($) {
	'use strict';

	//slider
	$('.slider').not('.slick-initialized').slick({
		slidesToShow: 1,
		slidesToScroll: 1,
		autoplay: true,
		dots: true,
		arrows: false
	});

})(jQuery);

  (function addHeadingLinks(){
    var article = document.getElementById('body');
    var headings = article.querySelectorAll('h1, h2, h3, h4, h5, h6');
    headings.forEach(function(heading){
      if(heading.id){
        var a = document.createElement('a');
        a.innerHTML = heading.innerHTML;
        a.href = '#'+heading.id;
        heading.innerHTML = '';
        heading.appendChild(a);
      }
    });
  })();