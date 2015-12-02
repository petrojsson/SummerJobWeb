
/**
 * New node file
 */


$(document).ready(function(){
	
//	if (isAdmin) {
//		$('#period_unique').show();
//	}
	
	if ($('#period_unique')) {
		if (isAdmin) {
			$('#period_unique').show();
		}
	}
	
	var geoAreaId = $('select#geoArea').val();
	$('#geoarea-description_' + geoAreaId).show();
	
	$( "input[name*='unique-period-startdate']" ).datepicker({
		minDate: new Date(),
		onSelect : function(selected) {
			$(this).focus();
			$("input[name*='unique-period-enddate']").datepicker("option", "minDate", selected);
		},
	});
	
	$( "input[name*='unique-period-enddate']" ).datepicker({
		minDate: new Date(),
		onSelect : function(selected) {
			$(this).focus();
			$("input[name*='unique-period-startdate']").datepicker("option", "maxDate", selected);
		},
	});	
	
	$('input[name="period_unique_checkbox"]').change(function() {
		if ($(this).is(':checked')) {
			$('input[name*="unique-period-"]').attr('disabled', false);
			$('input[name*="unique-period-"]').attr('required', true);
		} else {
			$('input[name*="unique-period-"]').attr('disabled', true);
			$('input[name*="unique-period-"]').attr('required', false);
		}
	});
	
	$( "input[name*='startDate']" ).datepicker({
		minDate: new Date(),
		onSelect : function(selected) {
			$(this).focus();
			$("input[name*='endDate']").datepicker("option", "minDate", selected);
			$("input[name*='lastApplicationDay']").datepicker("option", "maxDate", selected);
		},
	});
	
	$( "input[name*='endDate']" ).datepicker({
		minDate: new Date(),
		onSelect : function(selected) {
			$(this).focus();
			$("input[name*='startDate']").datepicker("option", "maxDate", selected);
		},
	});
	
	$( "input[name*='lastApplicationDay']" ).datepicker({
		minDate: new Date(),
	});			
	
	$('.add-municipality-mentor-btn').click(function(e){
		e.preventDefault();
		var periodId = $(this).parent().parent().attr('id');
		var id = periodId.split('_')[1];
		var mentorDiv = $(this).parent();
		appendMunicipalityMentor(mentorDiv, id);
	});
	
	$('.add-business-mentor-btn').click(function(e){
		e.preventDefault();
		appendBusinessMentor();
	});
	
	$("input.numberValidation").keydown(function (e) {
        // Allow: backspace, delete, tab, escape, enter and .
        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
             // Allow: Ctrl+A
            (e.keyCode == 65 && e.ctrlKey === true) ||
             // Allow: Ctrl+C
            (e.keyCode == 67 && e.ctrlKey === true) ||
             // Allow: Ctrl+X
            (e.keyCode == 88 && e.ctrlKey === true) ||
             // Allow: home, end, left, right
            (e.keyCode >= 35 && e.keyCode <= 39)) {
                 // let it happen, don't do anything
                 return;
        }
        // Ensure that it is a number and stop the keypress
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        }
    });
	
	$('div.remove-mentor').click(function (e) {
		console.log("Försöker ta bort en handledare..");
		var mentorRow = $(this).parent();
		mentorRow.find('#mentor-firstname').val("");
		mentorRow.find('#mentor-lastname').val("");
		mentorRow.find('#mentor-phone').val("");
		mentorRow.find('#mentor-email').val("");
		mentorRow.hide();
	});
	
	$('select#geoArea').change(function () {
		var id = $(this).val();
		$('[id^=geoarea-description_]').hide();
		$('#geoarea-description_' + id).show();
	});
	
	if ($('input[name*=hasDriversLicense]').is(':checked')) {
		$('#driverslicense_select').show();
	} else {
		$('#driverslicense_select').hide();
	}
	
	$('input[name*=hasDriversLicense]').click(function(e) {
		$('#driverslicense_select').fadeToggle('slow');
		
		if($('input[name*=hasDriversLicense]').is(':checked')) {
			$('select[name*=driversLicenseType]').attr("required", true);
		} else {
			$('select[name*=driversLicenseType').attr("required", false);
		}
	});
	
	$('#approve-job-button').click(function(e) {
		e.preventDefault();
		manageJob('/approvesummerjob.json');
	});
	
	$('#disapprove-job-button').click(function(e) {
		e.preventDefault();
		manageJob('/disapprovesummerjob.json');
	});
	
	$('#mark-job-as-initiated-button').click(function(e) {
		e.preventDefault();
		manageJob('/initiatesummerjob.json');
	});
	
	$('#business-sector-add-job-form').validator().on('submit', function (e) {
		  if (!e.isDefaultPrevented()) {
			  e.preventDefault();
			  saveNewBusinessSectorJob();
		  }
	});
	
	$('input.period-checkbox:checked').each(function() {
		var checkbox = $(this);
		var row = checkbox.parent().parent();
		$(row).parent().find('.add-mentor-div').removeClass('hidden');
	});
	
	$('input.period-checkbox').click(function(e) {
		var checkbox = $(this);
		var row = checkbox.parent().parent();
		if (checkbox.is(':checked')) {
			$(row).find('.numberOfWorkersField').attr("required", true);
			$(row).find('.numberOfWorkersField').attr("disabled", false);
		} else {
			$(row).find('.numberOfWorkersField').attr("required", false);
			$(row).find('.numberOfWorkersField').attr("disabled", true);
		}
		$(row).parent().find('.add-mentor-div').toggleClass('hidden');
	});
	
	$('#municipality-job-form').validator().on('submit', function (e) {
		console.log("$('#municipality-job-form').validator()");
		if (!e.isDefaultPrevented()) {
			e.preventDefault();
			
			var periodsChecked = 0;
			$('#periods-group').find('input[type="checkbox"]:checked').each(function () {
				periodsChecked++;
			});
			
			console.log("periodsChecked: " + periodsChecked);
			
			if (periodsChecked > 0) {
				$('#period-errors').hide();
				saveNewMunicipalityJob();
			} else {
				$('#period-errors').show();
			}
		} 
	});
	
});

function appendMunicipalityMentor(parent, periodId){
	var mentorTemplate = $('#mentor-template').clone();	
	var uuid = generateUUID();
	mentorTemplate.find('input').each(function(){
		var newName = $(this).attr('name');
		newName=newName + '_' + uuid + '_' + periodId;
		console.log(newName);
		$(this).attr('name', newName);
	});
	mentorTemplate.find('.collapse').addClass('in');
	$(parent).find('#mentors-wrapper').append($(mentorTemplate).html());
}

function appendBusinessMentor(){
	var mentorTemplate = $('#mentor-template').clone();	
	var uuid = generateUUID();
	mentorTemplate.find('input').each(function(){
		var newName = $(this).attr('name');
		newName=newName + '_' + uuid;
		$(this).attr('name', newName);
	});
	mentorTemplate.find('.collapse').addClass('in');
	$('#mentors-wrapper').append($(mentorTemplate).html());	
}

function generateUUID() {
	var chars = '0123456789abcdef'.split('');
	var uuid = [], rnd = Math.random;
	var r;
	uuid[8] = uuid[13] = uuid[18] = uuid[23] = '-';
	uuid[14] = '4';
	for (var i = 0; i < 36; i++) {
		if (!uuid[i]) {
			r = 0 | rnd()*16;
			uuid[i] = chars[(i == 19) ? (r & 0x3) | 0x8 : r & 0xf];
		}
	}
	return uuid.join('');
}

function saveNewBusinessSectorJob() {
	
	$('#save-succeeded').hide();
	$('#save-failed').hide();
	
	
	$.ajax({
		url: url + '/add/businesssectorsummerjob.json',
		type: "POST",
		data: $('#business-sector-add-job-form').serializeArray(),
		success: function(data, textStatus, jqXHR) {
		    if(data.status === 'success') {
		    	var jobId = $('input[name*=jobId]').val();
		    	if (jobId) {
					$('#save-succeeded .message').html(data.message);
					$('#save-succeeded').show();
				} else {
					window.location.href = "success?municipalityJob=false";
				}
		    } else {		        		
		    	$('#save-failed .message').html(data.message);
		    	$('#save-failed').show();
		    }
		 },
		 error: function(jqXHR, textStatus, errorThrown) {
			 $('#save-failed .message').html(jqXHR.responseText);
		     $('#save-failed').show();
		 }
	});
}

function saveNewMunicipalityJob() {
	console.log("saveNewMunicipalityJob");
	$('#save-succeeded').hide();
	$('#save-failed').hide();
	
	var nonCachedURL = url + '/add/municipalitysummerjob.json?rand=' + Math.random();
	console.log(nonCachedURL);
	
	$.ajax({
		url: nonCachedURL,
		type: "POST",
		data: $('#municipality-job-form').serializeArray(),
		success: function(data, textStatus, jqXHR) {
			if(data.status === 'success') {
				var jobId = $('input[name*=jobId]').val();
				if (jobId) {
					$('#save-succeeded .message').html(data.message);
					$('#save-succeeded').show();
				} else {
					window.location.href = "success?municipalityJob=true";
				}
			} else {		        		
				$('#save-failed .message').html(data.message);
				$('#save-failed').show();
			}
		},
		error: function(jqXHR, textStatus, errorThrown) {
			$('#save-failed .message').html(jqXHR.responseText);
			$('#save-failed').show();
		}
	});
}

function manageJob(urlPart, message) {
	$('#save-succeeded').hide();
	$('#save-failed').hide();
	
	$.ajax({
		url: url + urlPart,
		type: "POST",
		data: { jobId : $('#jobIdDiv').html(), adminNotes : $("textarea[name='admin-notes']").val(), 
			descriptionForEmploymentPapers : $("textarea[name='description-employment-papers']").val(),
			descriptionForCallPapers : $("textarea[name='description-call-papers']").val() },
		success: function(data, textStatus, jqXHR) {
			if(data.status === 'success') {
				$('#save-succeeded .message').html(data.message);
				$('#save-succeeded').show();
				manageJobButtons(urlPart);
			} else {		 
				$('#save-failed .message').html(data.message);
				$('#save-failed').show();
			}
		},
		error: function(jqXHR, textStatus, errorThrown) {
			$('#save-failed .message').html(jqXHR.responseText);
			$('#save-failed').show();
		}
	});
}

function manageJobButtons(urlPart) {
	switch (urlPart) {
	case '/approvesummerjob.json':
		$('#disapprove-job-button').attr("disabled", false);
		$('#approve-job-button').attr("disabled", true);
		break;

	case '/disapprovesummerjob.json':
		$('#approve-job-button').attr("disabled", false);
		$('#disapprove-job-button').attr("disabled", true);
		break;
	}
}
