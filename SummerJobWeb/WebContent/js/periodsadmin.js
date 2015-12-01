$(document).ready(function() {
	
	$( "input[name*='new-period-startdate']" ).datepicker({
		minDate: new Date(),
		onSelect : function(selected) {
			$(this).focus();
			$("input[name*='new-period-enddate']").datepicker("option", "minDate", selected);
		},
	});
	
	$( "input[name*='new-period-enddate']" ).datepicker({
		minDate: new Date(),
		onSelect : function(selected) {
			$(this).focus();
			$("input[name*='new-period-startdate']").datepicker("option", "maxDate", selected);
		},
	});		
	
	$( "input.period_startdate" ).datepicker({
		minDate: new Date(),
		onSelect : function(selected) {
			$(this).focus();
			var endDate = $(this).parent().parent().find('input.period_enddate');
			$(endDate).datepicker("option", "minDate", selected);
		},
	});
	
	$( "input.period_enddate" ).datepicker({
		minDate: new Date(),
		onSelect : function(selected) {
			$(this).focus();
			var startDate = $(this).parent().parent().find('input.period_startdate');
			$(startDate).datepicker("option", "maxDate", selected);
		},
	});		
	
	$(document).on('submit','#new-period-form', function(e) {
		e.preventDefault();
		console.log(e);
		saveNewPeriod();
	});
	
	$(document).on('submit','#periods-list-form', function(e) {
		e.preventDefault();
		console.log(e);
		savePeriodChanges();
	});
	
	$(document).on('submit','#salary-list-form', function(e) {
		e.preventDefault();
		console.log(e);
		saveSalary();
	});
	
	$(document).on('submit','#accounting-entries-list-form', function(e) {
		e.preventDefault();
		console.log(e);
		saveAccountingEntries();
	});
	
	$(document).on('submit','#place-for-information-form', function(e) {
		e.preventDefault();
		console.log(e);
		savePlaceForInformation();
	});
	
	$(document).on('submit','#contact-person-form', function(e) {
		e.preventDefault();
		console.log(e);
		saveContactPerson();
	});
});

function saveSalary() {
	$.ajax({
		url : url + '/save/salary.json',
		type: "POST",
		data: $('#salary-list-form').serialize(),
		success: function(data, textStatus, jqXHR) {
		    if(data.status === 'success') {
		    	$('#save-salary-failed').hide();
		    	$('#save-salary-succeeded .message').html(data.message);
				$('#save-salary-succeeded').show();
		    } else {
		    	$('#save-salary-succeeded').hide();
		    	$('#save-salary-failed .message').html(data.message);
				$('#save-salary-failed').show();
		    }
		 },
		 error: function(jqXHR, textStatus, errorThrown) {
			 console.log(textStatus);  
		 }
	});
}

function saveAccountingEntries() {
	$.ajax({
		url : url + '/save/accountingentries.json',
		type: "POST",
		data: $('#accounting-entries-list-form').serialize(),
		success: function(data, textStatus, jqXHR) {
		    if(data.status === 'success') {
		    	$('#save-accounting-failed').hide();
		    	$('#save-accounting-succeeded .message').html(data.message);
				$('#save-accounting-succeeded').show();
		    } else {
		    	$('#save-accounting-succeeded').hide();
		    	$('#save-accounting-failed .message').html(data.message);
				$('#save-accounting-failed').show();
		    }
		 },
		 error: function(jqXHR, textStatus, errorThrown) {
			 console.log(textStatus);  
		 }
	});
}

function savePlaceForInformation() {
	$.ajax({
		url : url + '/save/placeforinformation.json',
		type: "POST",
		data: $('#place-for-information-form').serialize(),
		success: function(data, textStatus, jqXHR) {
		    if(data.status === 'success') {
		    	$('#save-place-failed').hide();
		    	$('#save-place-succeeded .message').html(data.message);
				$('#save-place-succeeded').show();
		    } else {
		    	$('#save-place-succeeded').hide();
		    	$('#save-place-failed .message').html(data.message);
				$('#save-place-failed').show();
		    }
		 },
		 error: function(jqXHR, textStatus, errorThrown) {
			 console.log(textStatus);  
		 }
	});
}

function saveContactPerson() {
	$.ajax({
		url : url + '/save/contactperson.json',
		type: "POST",
		data: $('#contact-person-form').serialize(),
		success: function(data, textStatus, jqXHR) {
		    if(data.status === 'success') {
		    	$('#save-contact-failed').hide();
		    	$('#save-contact-succeeded .message').html(data.message);
				$('#save-contact-succeeded').show();
		    } else {
		    	$('#save-contact-succeeded').hide();
		    	$('#save-contact-failed .message').html(data.message);
				$('#save-contact-failed').show();
		    }
		 },
		 error: function(jqXHR, textStatus, errorThrown) {
			 console.log(textStatus);  
		 }
	});
}

function savePeriodChanges() {
	$.ajax({
		url : url + '/update/periods.json',
		type: "POST",
		data: $('#periods-list-form').serialize(),
		success: function(data, textStatus, jqXHR) {
			 if(data.status === 'success') {
			    $('#save-period-failed').hide();
			    $('#save-period-succeeded .message').html(data.message);
				$('#save-period-succeeded').show();
			 } else {
			    $('#save-period-succeeded').hide();
			    $('#save-period-failed .message').html(data.message);
				$('#save-period-failed').show();
			 }
		 },
		 error: function(jqXHR, textStatus, errorThrown) {
			 console.log(textStatus);  
		 }
	});
}

function saveNewPeriod() {
	$.ajax({
		url : url + '/add/period.json',
		type: "POST",
		data :  $('#new-period-form').serializeArray(),
		success: function(data, textStatus, jqXHR) {
			console.log(data);
		    if(data.status === 'success') {
		    	location.reload(true);
		    } else {		        		
		        alert(data);
		    }
		 },
		 error: function(jqXHR, textStatus, errorThrown) {
			 console.log(jqXHR.responseText);  
		 }
	});
}
