
/**
 * New node file
 */

// För sidor där vi inte returnerar en isAdmin-variabel (de flesta ställena).
var isAdmin = false;

$(document).ready(function(){
	
//	if (isAdmin) {
//		$('#period_unique').show();
//	}
	
	if ($('#period_unique')) {
		if (isAdmin) {
			$('#period_unique').show();
		}
	}
	
	$('.job-row').click(function(e) {
		var moreInfo = $(this).parent().find(".more-information");
		$(moreInfo).toggleClass('hidden');
	});
	
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
//			$("input[name*='unique-period-startdate']").datepicker("option", "maxDate", selected);
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
	
//	$('.add-business-mentor-btn').click(function(e){
//		e.preventDefault();
//		appendBusinessMentor();
//	});
	
	$(document).on('keydown', 'input.numberValidation', function(e) {

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
	
	$(document).on('click', 'div.remove-mentor', function(e) {
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
	
	$('#save-job-options').click(function(e) {
		e.preventDefault();
		manageJob('/savejoboptions.json');
	});
	
	$('#mark-job-as-initiated-button').click(function(e) {
		e.preventDefault();
		manageJob('/initiatesummerjob.json');
	});
	
	$('#business-sector-add-job-form').validator().on('submit', function (e) {
		  if (!e.isDefaultPrevented()) {
			  e.preventDefault();
			  previewBusinessSectorJob();
		  } else {
			  $('body').scrollTo($('body').find('.has-error').first().offset().top - 56, 'slow');
		  }
	});
	
	$('#cancel-preview-business-sector-job').click(function(e) {
		$('#preview-template').hide();
		$('.preview-mentor-showing').remove();
		$('.createJobHeadline').show();
		$('form#business-sector-add-job-form').show();
		$("html, body").animate({ scrollTop: 0 }, "slow");
	});
	
	$('#cancel-preview-municipality-job').click(function(e) {
		$('#preview-template').hide();
		$('.preview-period-showing').remove();
		$('.createJobHeadline').show();
		$('form#municipality-job-form').show();
		$("html, body").animate({ scrollTop: 0 }, "slow");
	});
	
	$('#submit-business-sector-job').click(function(e) {
		saveNewBusinessSectorJob();
	});
	
	$('#submit-municipality-job').click(function(e) {
		saveNewMunicipalityJob();
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
		
		var periodsChecked = 0;
		$('#periods-group').find('input[type="checkbox"]:checked').each(function () {
			periodsChecked++;
		});
		
		if (!e.isDefaultPrevented()) {
			e.preventDefault();
			
			console.log("periodsChecked: " + periodsChecked);
			
			if (periodsChecked > 0) {
				$('#periods-group').removeClass('has-error');
				previewMunicipalityJob();
			} else {
				$('#periods-group').addClass('has-error');
				$('body').scrollTo($('body').find('.has-error').first().offset().top - 56, 'slow');
			}
		} else {
			if (periodsChecked == 0) {
				$('#periods-group').addClass('has-error');
			}
			
			$('body').scrollTo($('body').find('.has-error').first().offset().top - 56, 'slow');
		} 
	});
	
});

function appendMunicipalityMentor(parent, periodId){
	var mentorTemplate = $('.mentor-template').clone();	
	var uuid = generateUUID();
	mentorTemplate.find('input').each(function(){
		var newName = $(this).attr('name');
		newName=newName + '_' + uuid + '_' + periodId;
		console.log(newName);
		$(this).attr('name', newName);
	});
	mentorTemplate.find('.collapse').addClass('in');
	mentorTemplate.removeClass("mentor-template");
	$(parent).find('.mentors-wrapper').append($(mentorTemplate).html());
}

//function appendBusinessMentor(){
//	var mentorTemplate = $('.mentor-template').clone();	
//	var uuid = generateUUID();
//	mentorTemplate.find('input').each(function(){
//		var newName = $(this).attr('name');
//		newName=newName + '_' + uuid;
//		$(this).attr('name', newName);
//	});
//	mentorTemplate.find('.collapse').addClass('in');
//	mentorTemplate.removeClass('mentor-template');
//	$('#mentors-wrapper').append($(mentorTemplate).html());	
//}

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
	
	$('.save-succeeded').hide();
	$('.save-failed').hide();
	
//	$('#preview-template').hide();
//	$('.createJobHeadline').show();
//	$('form#business-sector-add-job-form').show();
//	$("html, body").animate({ scrollTop: $(document).height() }, "slow");
	
	$.ajax({
		url: url + '/add/businesssectorsummerjob.json',
		type: "POST",
		data: $('#business-sector-add-job-form').serializeArray(),
		success: function(data, textStatus, jqXHR) {
		    if(data.status === 'success') {
		    	var jobId = $('input[name*=jobId]').val();
		    	if (jobId) {
		    		$('#preview-template').hide();
		    		$('.createJobHeadline').show();
		    		$('form#business-sector-add-job-form').show();
		    		$("html, body").animate({ scrollTop: $(document).height() }, "slow");
					$('.save-succeeded .message').html(data.message);
					$('.save-succeeded').show();
				} else {
					window.location.href = "success?municipalityJob=false";
				}
		    } else {		        		
		    	$('.save-failed .message').html(data.message);
		    	$('.save-failed').show();
		    }
		 },
		 error: function(jqXHR, textStatus, errorThrown) {
			 $('.save-failed .message').html(jqXHR.responseText);
		     $('.save-failed').show();
		 }
	});
}

function saveNewMunicipalityJob() {
	console.log("saveNewMunicipalityJob");
	$('.save-succeeded').hide();
	$('.save-failed').hide();
	
//	$('#preview-template').hide();
//	$('.createJobHeadline').show();
//	$('form#municipality-job-form').show();
//	$("html, body").animate({ scrollTop: $(document).height() }, "slow");
	
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
					$('#preview-template').hide();
					$('.createJobHeadline').show();
					$('form#municipality-job-form').show();
					$("html, body").animate({ scrollTop: $(document).height() }, "slow");
					$('.save-succeeded .message').html(data.message);
					$('.save-succeeded').show();
				} else {
					window.location.href = "success?municipalityJob=true";
				}
			} else {		        		
				$('.save-failed .message').html(data.message);
				$('.save-failed').show();
			}
		},
		error: function(jqXHR, textStatus, errorThrown) {
			$('.save-failed .message').html(jqXHR.responseText);
			$('.save-failed').show();
		}
	});
}

function manageJob(urlPart) {
	$('.save-succeeded').hide();
	$('.save-failed').hide();
	
	$.ajax({
		url: url + urlPart,
		type: "POST",
		data: { jobId : $('#jobIdDiv').html(), adminNotes : $("textarea[name='admin-notes']").val(), 
			descriptionForEmploymentPapers : $("textarea[name='description-employment-papers']").val(),
			descriptionForCallPapers : $("textarea[name='description-call-papers']").val(),
			statusApprove : $('select[name="job-status-select"]').val() },
		success: function(data, textStatus, jqXHR) {
			if(data.status === 'success') {
				$('.save-succeeded .message').html(data.message);
				$('.save-succeeded').show();
			} else {		 
				$('.save-failed .message').html(data.message);
				$('.save-failed').show();
			}
		},
		error: function(jqXHR, textStatus, errorThrown) {
			$('.save-failed .message').html(jqXHR.responseText);
			$('.save-failed').show();
		}
	});
}

function previewBusinessSectorJob() {
	$('#preview-worktitle').html($('#profession').val());
	$('#preview-workdescription').html($('#work-description').val());
	$('#preview-numberNeeded').html($('#numberOfWorkersNeeded').val());
	$('#preview-startDate').html($('#startDate').val());
	$('#preview-endDate').html($('#endDate').val());
	$('#preview-lastApplicationDay').html($('#lastApplicationDay').val());
	
	$('#preview-mentor-firstname').html($('#mentor-firstname').val());
	$('#preview-mentor-lastname').html($('#mentor-lastname').val());
	$('#preview-mentor-phone').html($('#mentor-phone').val());
	$('#preview-mentor-email').html($('#mentor-email').val());
	
//	$('form').find('[name^="mentor-firstname"]').each(function() {
//		var nameArray = $(this).attr('name').split("_");
//		var mentorId;
//		if (nameArray.length == 3) {
//			mentorId = nameArray[1] + "_" + nameArray[2];
//		} else {
//			mentorId = nameArray[1];
//		}
//		
//		var mentorFirstname = $('input[name="mentor-firstname_' + mentorId + '"]').val();
//		var mentorLastname = $('input[name="mentor-lastname_' + mentorId + '"]').val();
//		var mentorPhone = $('input[name="mentor-phone_' + mentorId + '"]').val();
//		var mentorEmail = $('input[name="mentor-email_' + mentorId + '"]').val();
//		
//		var mentorRow = $('.preview-mentor-row').clone();
//		mentorRow.find('.preview-mentor-firstname').html(mentorFirstname);
//		mentorRow.find('.preview-mentor-lastname').html(mentorLastname);
//		mentorRow.find('.preview-mentor-phonenumber').html(mentorPhone);
//		mentorRow.find('.preview-mentor-email').html(mentorEmail);
//		
//		$(mentorRow).addClass('preview-mentor-showing');
//		$(mentorRow).removeClass('preview-mentor-row');
//		$(mentorRow).show();
//		$(mentorRow).appendTo($('#preview-mentor-body'));
//	});
	
	$('#preview-corporate-number').html($('#corporate-number').val());
	$('#preview-company').html($('#company').val());
	$('#preview-streetAddress').html($('#street').val());
	$('#preview-zipcode').html($('#postalcode').val());
	$('#preview-city').html($('#postalarea').val());
	$('#preview-manager-firstname').html($('#manager-firstname').val());
	$('#preview-manager-lastname').html($('#manager-lastname').val());
	$('#preview-manager-phonenumber').html($('#manager-phone').val());
	$('#preview-manager-email').html($('#manager-email').val());
	
	
	$('#preview-driverslicense').text($('#driversLicenseType :selected').html());
	
	
	if ($('#mustBeOverEighteen').is(':checked')) {
		$('#preview-age').text($('#overEighteenNeededText').val());
	} else {
		$('#preview-age').text($('#overEighteenNotNeededText').val());
	}
	
	if ($('#inChargeOfInterviews').is(':checked')) {
		$('#preview-inChargeOfInterviews').html($('#inChargeOfInterviewsText').val());
	} else {
		$('#preview-inChargeOfInterviews').html($('#notInChargeOfInterviewsText').val());
	}
	
	$('#preview-otherrequirements').html($('#other-requirements').val());
	$('#preview-freetext').html($('#freetext').val());
	
	$('form#business-sector-add-job-form').hide();
	$('.createJobHeadline').hide();
	$('#preview-template').show();
	$("html, body").animate({ scrollTop: 0 }, "slow");
}

//TODO same same som i ovan.
function previewMunicipalityJob() {
	$('#preview-organisation').html($('#organisation').val());
	$('#preview-administration').html($('#administration').val());
	$('#preview-location').html($('#location').val());
	$('#preview-area').html($('#area :selected').html());
	$('#preview-street').html($('#street').val());
	$('#preview-zipcode').html($('#postalcode').val());
	$('#preview-city').html($('#postalarea').val());
	$('#preview-department').html($('#department').val());
	$('#preview-geoarea').html($('#geoArea :selected').html());
	$('#preview-worktitle').html($('#work-title').val());
	$('#preview-workdescription').html($('#work-description').val());
	
	$('#preview-manager-firstname').html($('#manager-firstname').val());
	$('#preview-manager-lastname').html($('#manager-lastname').val());
	$('#preview-manager-phoneNumber').html($('#manager-phone').val());
	$('#preview-manager-email').html($('#manager-email').val());
	
	
	$('form').find('.period-div').each(function(index) {
		console.log(index);
		var periodNr = $(this).attr('id').split("_")[1];
		var currentPeriod = $(this);
		
		if ($(currentPeriod).find('input[type="checkbox"]').is(':checked')) {
			console.log("Denna period är checkad: " + periodNr);
			var periodTemplate = $('.preview-period-template').clone();
			
			var periodName;
			var periodStartDate;
			var periodEndDate;
			
			if (periodNr == "1337") {
				periodName = $(currentPeriod).find('.periodName').val();
				periodStartDate = $(currentPeriod).find('.periodStartDate').val();
				periodEndDate = $(currentPeriod).find('.periodEndDate').val();
			} else {
				periodName = $(currentPeriod).find('.periodName').html();
				periodStartDate = $(currentPeriod).find('.periodStartDate').html();
				periodEndDate = $(currentPeriod).find('.periodEndDate').html();
			}
			
			$(periodTemplate).find('.preview-period-name').text(periodName);
			$(periodTemplate).find('.preview-period-startdate').text(periodStartDate);
			$(periodTemplate).find('.preview-period-enddate').text(periodEndDate);
			$(periodTemplate).find('.preview-period-numberOfWorkers').html($(currentPeriod).find('.numberOfWorkersField').val());
			
			var numberOfMentors = 0;
			
			$(currentPeriod).find('[name^="mentor-firstname"]').each(function(index) {
				console.log("Varje mentor: " + index);
				numberOfMentors++;
				
				var nameArray = $(this).attr('name').split("_");
				var mentorId;
				if (nameArray.length == 3) {
					mentorId = nameArray[1] + "_" + nameArray[2];
				} else {
					mentorId = nameArray[1];
				}
				
				console.log("mentorId: " + mentorId);
				
				var mentorFirstname = $('input[name="mentor-firstname_' + mentorId + '"]').val();
				var mentorLastname = $('input[name="mentor-lastname_' + mentorId + '"]').val();
				var mentorPhone = $('input[name="mentor-phone_' + mentorId + '"]').val();
				var mentorEmail = $('input[name="mentor-email_' + mentorId + '"]').val();
		
				var mentorRow = $(periodTemplate).find('.preview-mentor-row').clone();
				mentorRow.find('.preview-mentor-firstname').html(mentorFirstname);
				mentorRow.find('.preview-mentor-lastname').html(mentorLastname);
				mentorRow.find('.preview-mentor-phonenumber').html(mentorPhone);
				mentorRow.find('.preview-mentor-email').html(mentorEmail);
				
				console.log("mentorRow: " + mentorRow.find('.preview-mentor-firstname').html());
				
				$(mentorRow).removeClass('preview-mentor-row');
				$(mentorRow).show();
				$(mentorRow).appendTo($(periodTemplate).find('.preview-mentor-body'));
			});
			
			console.log("numberOfMentors: " + numberOfMentors);
			
			$(periodTemplate).addClass('preview-period-showing');
			$(periodTemplate).removeClass('preview-period-template');
//			$(periodTemplate).show();
			$(periodTemplate).appendTo('#preview-period-div');
		}
	});


	$('#preview-driverslicense').text($('#driversLicenseType :selected').html());
	

	if ($('#mustBeOverEighteen').is(':checked')) {
		$('#preview-age').text($('#overEighteenNeededText').val());
	} else {
		$('#preview-age').text($('#overEighteenNotNeededText').val());
	}

	$('#preview-otherrequirements').html($('#other-requirements').val());
	$('#preview-freetext').html($('#freetext').val());

	$('form#municipality-job-form').hide();
	$('.createJobHeadline').hide();
	$('#preview-template').show();
	$("html, body").animate({ scrollTop: 0 }, "slow");
}
