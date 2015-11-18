$(document).ready(function() {
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
	 
	 $('#approve-application-button').click(function(e) {
		 e.preventDefault();
		 manageApplication('/approveapplication.json');
	 });
		
	 $('#disapprove-application-button').click(function(e) {
		 e.preventDefault();
		 manageApplication('/disapproveapplication.json');
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
			saveMunicipalityJobApplication();
		} 
	 });
	 
	$('#business-job-application-form').validator().on('submit', function (e) {
		if (!e.isDefaultPrevented()) {
			e.preventDefault();
			saveBusinessJobApplication();
		} 
	});
});

function saveMunicipalityJobApplication() {
	$('#save-succeeded').hide();
	$('#save-failed').hide();
	
	$.ajax({
		url: url + '/save/municipalityapplication.json',
		type: "POST",
		data: $('#municipality-job-application-form').serializeArray(),
		success: function(data, textStatus, jqXHR) {
			if(data.status === 'success') {
				var appId = $('input[name*=appId]').val();
				if (appId) {
					$('#save-succeeded .message').html(data.message);
					$('#save-succeeded').show();
				} else {
					window.location.href = "success?municipalityJobApplication=true";
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

function saveBusinessJobApplication() {
	$('#save-succeeded').hide();
	$('#save-failed').hide();
	
	$.ajax({
		url: url + '/save/businessapplication.json',
		type: "POST",
		data: $('#business-job-application-form').serializeArray(),
		success: function(data, textStatus, jqXHR) {
			if(data.status === 'success') {
				var appId = $('input[name*=appId]').val();
				if (appId) {
					$('#save-succeeded .message').html(data.message);
					$('#save-succeeded').show();
				} else {
					window.location.href = "success?municipalityJobApplication=false";
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

function manageApplication(urlPart, message) {
	$('#save-succeeded').hide();
	$('#save-failed').hide();
	
	$.ajax({
		url: url + urlPart,
		type: "POST",
		data: { appId : $('#appIdDiv').html(), adminNotes : $("textarea[name='admin-notes']").val(), 
			ranking : $("select[name='ranking']").val() },
		success: function(data, textStatus, jqXHR) {
			if(data.status === 'success') {
				$('#save-succeeded .message').html(data.message);
				$('#save-succeeded').show();
				manageApplicationButtons(urlPart);
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

function manageApplicationButtons(urlPart) {
	switch (urlPart) {
	case '/approveapplication.json':
		$('#disapprove-application-button').attr("disabled", false);
		$('#approve-application-button').attr("disabled", true);
		break;

	case '/disapproveapplication.json':
		$('#approve-application-button').attr("disabled", false);
		$('#disapprove-application-button').attr("disabled", true);
		break;
	}
}