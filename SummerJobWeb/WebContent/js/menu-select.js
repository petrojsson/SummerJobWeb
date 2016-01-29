$(document).ready(function() {
	var pathname = window.location.pathname;
	var lastChar =pathname.substr(pathname.length-1);
	
	if(pathname.length >1 && lastChar.lastIndexOf('/')>=0){
		console.log('last char is /');
		pathname = pathname.slice(0,-1);
		console.log(pathname);
	}
	
	$('nav a[href="' + pathname + '"]').parent().addClass('active');
	
	if($('ul.nav.navbar-nav > li.active').length<1){
		
		$('nav ul.dropdown-menu li.active').parent().parent().addClass('active');
	}
	
});