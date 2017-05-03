$(document).ready(function() {
	$('#fullpage').fullpage({
		anchors: ['primeiraPagina', 'segundaPagina', 'terceiraPagina', 'quartaPagina', 'quintaPagina', 'sextaPagina', 'seventh', 'eighth'],
		sectionsColor: ['#7bd447', '#fff', '#fbfbfb', '#fff', '#fbfbfb', '#fff'],
		navigation: true,
		navigationPosition: 'right',
		navigationTooltips: ['Início', 'Introdução', 'Análise de Currículo', 'Criação de currículo', 'Profissional em tempo real', 'Eu quero ser PREMIUM'],
		responsive:900,
	  continuousVertical: false,
		scrollOverflow: false
	});

	$('.fancybox').fancybox();
	$('.fancybox-thumbs').fancybox({
		prevEffect : 'none',
		nextEffect : 'none',

		closeBtn  : false,
		arrows    : false,
		nextClick : true,

		helpers : {
			thumbs : {
				width  : 50,
				height : 50
			}
		}
	});

	  $("#owl-demo").owlCarousel({
 
      autoPlay: 3000, //Set AutoPlay to 3 seconds
 
      items : 3,
      itemsDesktop : [1199,3],
      itemsDesktopSmall : [979,3],
      pagination: false,
      navigation: false,
      paginationSpeed: 200,
      rewindSpeed: 300
 
  });

});


// Wow js activation
 new WOW().init();