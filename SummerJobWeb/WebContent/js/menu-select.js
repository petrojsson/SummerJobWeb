$(document).ready(function() {
	$('nav a[href="' + window.location.pathname + '"]').parent().addClass('active');
	$('nav li.navbar-dropdown-menu ul.dropdown-menu a[href="' + window.location.pathname + window.location.search + '"]').parent().addClass('active');
	var parentDropdown = $('nav li.navbar-dropdown-menu ul.dropdown-menu').find('.active').parent().parent();
	$(parentDropdown).addClass('active');
});