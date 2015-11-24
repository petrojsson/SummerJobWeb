$(document).ready(function() {
	$(document).on('submit','#new-period-form', function(e) {
		e.preventDefault();
		console.log(e);
		console.log( $('#new-period-form').serializeArray());
		saveNew();
	});
	
	$(document).on('submit','#periods-list-form', function(e) {
		e.preventDefault();
		console.log(e);
		console.log( $('#periods-list-form').serializeArray());
		saveChanges();
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

function saveChanges() {
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

function saveNew() {
	$.ajax({
		url : url + '/add/period.json',
		type: "POST",
		data :  $('#new-period-form').serializeArray(),
		success: function(data, textStatus, jqXHR) {
			console.log(data);
		    if(data.status === 'success') {
		    	location.reload(true);
//		        var alternativeID = data.data.alternativeID;
//		        var name = data.data.name;
//		        var fromdate = data.data.fromDate;
//		        var todate = data.data.toDate;
//		        var tableRow ='<tr id="periodId_' + alternativeID + '"><td id=period_name_' + alternativeID + '"><input id="period_name_' + alternativeID + '" type="text" value="' + name + '" name="period_name_' + alternativeID + '"></input></td><td><input id="period_fromdate_' + alternativeID + '" type="text" value="' + fromdate + '" name="period_fromdate_' + alternativeID + '"></input></td><td><input id="period_todate_' + alternativeID + '" type="text" value="' + todate + '" name="period_todate_' + alternativeID + '"></input></td>';
//		        $('#periods-table tbody').append(tableRow);
//		        
//		        $("input[name*='new-period-name']").val('');
//		        $("input[name*='new-period-fromdate']").val('');
//		        $("input[name*='new-period-todate']").val('');
		    } else {		        		
		        alert(data);
		    }
		 },
		 error: function(jqXHR, textStatus, errorThrown) {
			 console.log(jqXHR.responseText);  
		 }
	});
}
