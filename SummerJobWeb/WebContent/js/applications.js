$(document).ready(function() {
	
	$('button#clear-search-button').click(function(e) {
		e.preventDefault();
		var form = $(this).parents('form:first');
		$(form).each(function() {
			$(this).find(':input').val("");
		});
		
		$(form).submit();
	});

	$('.business-application-row').click(function(e) {
		var moreInfo = $(this).parent().find(".more-information");
		$(moreInfo).toggleClass('hidden');
		$(this).find('.more-information-arrow').find('.arrow-down').toggleClass('hidden');
		$(this).find('.more-information-arrow').find('.arrow-up').toggleClass('hidden');
	});
	 
	$('.municipality-application-row').click(function(e) {
		var url = $(this).find('input[type=hidden]').val();
		window.location.href = url;
	});

//	$('#approve-application-button').click(function(e) {
//		e.preventDefault();
//		manageApplication('/approveapplication.json');
//	});
//
//	$('#disapprove-application-button').click(function(e) {
//		e.preventDefault();
//		manageApplication('/disapproveapplication.json');
//	});
	
	$('#save-application-options').click(function(e) {
		e.preventDefault();
		manageApplication();
	});

	// If the checkbox has an initial value, we don't want some stuff to be required.
	if ($('input[name*=noPreferedArea').is(':checked')) {
		$('[id^=preferedArea]').attr("required", false);
		$('[id^=preferedArea]').attr("disabled", true);
	} else {
		$('[id^=preferedArea]').attr("required", true);
		$('[id^=preferedArea]').attr("disabled", false);
	}

	$('input[name*=noPreferedArea').click(function(e) {
		if ($(this).is(':checked')) {
			$('[id^=preferedArea]').attr("required", false);
			$('[id^=preferedArea]').attr("disabled", true);
		} else {
			$('[id^=preferedArea]').attr("required", true);
			$('[id^=preferedArea]').attr("disabled", false);
		}
	});
	
	$('#municipality-job-application-form').validator().on('submit', function (e) {
		if (!e.isDefaultPrevented()) {
			e.preventDefault();
//			saveMunicipalityJobApplication();
			previewMunicipalityJobApplication();
		} else {
			$('body').scrollTo($('body').find('.has-error').first().offset().top - 56, 'slow');
		}
	});
	
	$('#submit-municipality-job-application').click(function(e) {
		saveMunicipalityJobApplication();
	});
	
	$('#cancel-preview-municipality-application').click(function(e) {
		$('#preview-template').hide();
		$('.createJobHeadline').show();
		$('#municipality-job-application-form').show();
		$('body').scrollTo('#municipality-job-application-form', 'slow');
	});

	$('#submit-business-job-application').click(function(e) {
		saveBusinessJobApplication();
	});
	
	$('#cancel-preview-business-sector-application').click(function(e) {
		$('#preview-template').hide();
		$('#business-job-application-form').show();
		$('body').scrollTo('#business-job-application-form', 'slow');
	});
	
	$('#business-job-application-form').validator().on('submit', function (e) {
		if (!e.isDefaultPrevented()) {
			e.preventDefault();
			previewBusinessJobApplication();
		} else {
			$('body').scrollTo($('body').find('.has-error').first().offset().top - 56, 'slow');
		}
	});
});

function saveMunicipalityJobApplication() {
	$('.save-succeeded').hide();
	$('.save-failed').hide();
	var data = new FormData($('#municipality-job-application-form')[0]);
	$.ajax({
		url: url + '/save/municipalityapplication.json',
		type: "POST",
		data: data,
		contentType: false,
		processData: false,
		success: function(data, textStatus, jqXHR) {
			if(data.status === 'success') {
				var appId = $('input[name*="appId"]').val();
				if (appId) {
					$('.save-succeeded .message').html(data.message);
					$('.save-succeeded').show();
					$('#preview-template').hide();
					$('#municipality-job-application-form').show();
					$('body').scrollTo('.save-succeeded', 'slow');
				} else {
					window.location.href = "success?municipalityJobApplication=true";
				}
			} else {
				console.log("Vi kör elsen, som tur är.");
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

function saveBusinessJobApplication() {
	$('.save-succeeded').hide();
	$('.save-failed').hide();
	var data = new FormData($('#business-job-application-form')[0]);
	
	$.ajax({
		url: url + '/save/businessapplication.json',
		type: "POST",
		data: data,
		contentType: false,
		processData: false,
		success: function(data, textStatus, jqXHR) {
			if(data.status === 'success') {
				var appId = $('input[name*="appId"]').val();
				if (appId) {
					$('.save-succeeded .message').html(data.message);
					$('.save-succeeded').show();
					$('#preview-template').hide();
					$('#business-job-application-form').show();
					$('body').scrollTo('.save-succeeded', 'slow');
				} else {
					window.location.href = "success?municipalityJobApplication=false";
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

function manageApplication() {
	$('.save-succeeded').hide();
	$('.save-failed').hide();
	
	$.ajax({
		url: url + '/saveapplicationoptions.json',
		type: "POST",
		data: { appId : $('#appIdDiv').html(), adminNotes : $("textarea[name='admin-notes']").val(), 
			statusApprove : $('select[name="application-status-select"]').val(),
			ranking : $("select[name='ranking']").val(), },
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

function previewBusinessJobApplication() {
	$('#preview-socialsecuritynumber').html($('#socialSecurityNumber').val());
	$('#preview-firstname').html($('#firstname').val());
	$('#preview-lastname').html($('#lastname').val());
	$('#preview-phonenumber').html($('#phone').val());
	$('#preview-email').html($('#email').val());
	$('#preview-streetaddress').html($('#street').val());
	$('#preview-zipcode').html($('#postalcode').val());
	$('#preview-city').html($('#postalarea').val());
	
	$('#preview-personalletter').html($('#personal-letter').val());
	
//	currentCV
	if ($('#cvInputFile').val().length === 0) {
		$('#preview-cv').html($('#currentCV').html());
	} else {
		var cvFilenameArray = $('#cvInputFile').val().split("\\"); // För att ta bort den fakeade sökvägen. Vill endast visa filnamnet.
		$('#preview-cv').html(cvFilenameArray[cvFilenameArray.length - 1]);
	}
	
//	var cvFilenameArray = $('#cvInputFile').val().split("\\"); // För att ta bort den fakeade sökvägen. Vill endast visa filnamnet.
//	$('#preview-cv').html(cvFilenameArray[cvFilenameArray.length - 1]);
	
	
	$('#preview-driverslicense').html($('#driversLicenseType :selected').html());
	
	
	$('#business-job-application-form').hide();
	$('#preview-template').show();
	$('body').scrollTo('#preview-template', 'slow');
}

function previewMunicipalityJobApplication() {
	$('#preview-socialsecuritynumber').html($('#socialSecurityNumber').val());
	$('#preview-firstname').html($('#firstname').val());
	$('#preview-lastname').html($('#lastname').val());
	$('#preview-phonenumber').html($('#phone').val());
	$('#preview-email').html($('#email').val());
	$('#preview-streetaddress').html($('#street').val());
	$('#preview-zipcode').html($('#postalcode').val());
	$('#preview-city').html($('#postalarea').val());
	
	$('#preview-personalletter').html($('#personal-letter').val());
	
	if ($('#cvInputFile').val().length === 0) {
		$('#preview-cv').html($('#currentCV').html());
	} else {
		var cvFilenameArray = $('#cvInputFile').val().split("\\"); // För att ta bort den fakeade sökvägen. Vill endast visa filnamnet.
		$('#preview-cv').html(cvFilenameArray[cvFilenameArray.length - 1]);
	}
	
	$('#preview-preferedPeriod').html($('select[name="preferedPeriod"] :selected').html());
	
	if ($('#noPreferedArea').is(':checked')) {
		$('#preview-nopreferedarea').show();
		$('.preview-preferedarea').hide();
	} else {
		$('#preview-nopreferedarea').hide();
		$('.preview-preferedarea').show();
		$('#preview-preferedarea1').html($('#preferedArea1 :selected').html());
		$('#preview-preferedarea2').html($('#preferedArea2 :selected').html());
		$('#preview-preferedarea3').html($('#preferedArea3 :selected').html());
	}
	
	$('#preview-geoarea1').html($('#geoArea1 :selected').html());
	$('#preview-geoarea2').html($('#geoArea2 :selected').html());
	$('#preview-geoarea3').html($('#geoArea3 :selected').html());
	
	$('#preview-driverslicense').html( $('#driversLicenseType :selected').html());

	$('#municipality-job-application-form').hide();
	$('.createJobHeadline').hide();
	$('#preview-template').show();
	$('body').scrollTo('#preview-template', 'slow');
}