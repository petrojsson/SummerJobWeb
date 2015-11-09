
/**
 * New node file
 */


$(document).ready(function(){
	if($('.add-mentor-btn')){
		appendMentor();
		$('.add-mentor-btn').click(function(e){
			e.preventDefault();
			appendMentor();
		});
	}
	
	$('.remove-mentor').click(function (e) {
		var mentorRow = $(this).parent().parent();
		mentorRow.hide();
		mentorRow.find('#mentor-firstname').val("");
		mentorRow.find('#mentor-lastname').val("");
		mentorRow.find('#mentor-phone').val("");
		mentorRow.find('#mentor-email').val("");
	});
	
	if ($('input[name*=hasDriversLicense]').is(':checked')) {
		$('#driverslicense_select').show();
	} else {
		$('#driverslicense_select').hide();
	}
	
	$('input[name*=hasDriversLicense]').click(function(e) {
		$('#driverslicense_select').fadeToggle('slow');
	});
	
	$('#approve-businessjob-button').click(function(e) {
		e.preventDefault();
		manageBusinessJob('/approvesummerjob.json');
	});
	
	$('#disapprove-businessjob-button').click(function(e) {
		e.preventDefault();
		manageBusinessJob('/disapprovesummerjob.json');
	});
	
	$('#mark-businessjob-as-initiated-button').click(function(e) {
		e.preventDefault();
		manageBusinessJob('/initiatesummerjob.json');
	});
	
	$('#business-sector-add-job-form').validator().on('submit', function (e) {
		  if (!e.isDefaultPrevented()) {
			  e.preventDefault();
			  saveNewBusinessSectorJob();
		  }
	});
	
	$('input.period-checkbox').click(function(e) {
		var checkbox = $(this);
		var tableRow = checkbox.parent().parent();
		if (checkbox.is(':checked')) {
			tableRow.find('.numberOfWorkersField').attr("required", true);
		} else {
			tableRow.find('.numberOfWorkersField').attr("required", false);
		}
	});
	
	$('#municipality-job-form').validator().on('submit', function (e) {
		if (!e.isDefaultPrevented()) {
			e.preventDefault();
			
			var periodsChecked = 0;
			$('#period-table').find('input[type="checkbox"]:checked').each(function () {
				periodsChecked++;
			});
			
			if (periodsChecked > 0) {
				$('#period-errors').hide();
				saveNewMunicipalityJob();
			} else {
				$('#period-errors').show();
			}
		} 
	});
});

function appendMentor(){
	var mentorTemplate = $('#mentor-template').clone();			
	var uuid = generateUUID();
	mentorTemplate.find('input').each(function(){
		var newName = $(this).attr('name');
		newName=newName+'_'+uuid;
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
		    	$('#save-succeeded .message').html(data.message);
		    	$('#save-succeeded').show();
		    	$('#business-sector-add-job-form').trigger("reset");
		    	
		    	if ($('input[name*=hasDriversLicense]').is(':checked')) {
		    		$('#driverslicense_select').show();
		    	} else {
		    		$('#driverslicense_select').hide();
		    	}
		    	
//		    	$('#driverslicense_select').hide();
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
	
	$('#save-succeeded').hide();
	$('#save-failed').hide();
	
	$.ajax({
		url: url + '/add/municipalitysummerjob.json',
		type: "POST",
		data: $('#municipality-job-form').serializeArray(),
		success: function(data, textStatus, jqXHR) {
			if(data.status === 'success') {
				$('#save-succeeded .message').html(data.message);
				$('#save-succeeded').show();
				$('#municipality-job-form').trigger("reset");
//				$('#driverslicense_select').hide();
				
				if ($('input[name*=hasDriversLicense]').is(':checked')) {
					$('#driverslicense_select').show();
				} else {
					$('#driverslicense_select').hide();
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

function manageBusinessJob(urlPart) {
	$('#save-succeeded').hide();
	$('#save-failed').hide();
	
	$.ajax({
		url: url + urlPart,
		type: "POST",
		data: { jobId : $('#jobIdDiv').html(), adminNotes : $("textarea[name='admin-notes']").val() },
		success: function(data, textStatus, jqXHR) {
			if(data.status === 'success') {
				$('#save-succeeded .message').html(data.message);
				$('#save-succeeded').show();
				manageBusinessJobButtons(urlPart);
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

function manageBusinessJobButtons(urlPart) {
	switch (urlPart) {
	case '/approvesummerjob.json':
		$('#disapprove-businessjob-button').attr("disabled", false);
		$('#approve-businessjob-button').attr("disabled", true);
		break;

	case '/disapprovesummerjob.json':
		$('#approve-businessjob-button').attr("disabled", false);
		$('#disapprove-businessjob-button').attr("disabled", true);
		break;
	}
}
