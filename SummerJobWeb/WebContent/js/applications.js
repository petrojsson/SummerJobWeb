$(document).ready(function() {
	 $('.business-application-row').click(function(e) {
		var moreInfo = $(this).parent().find(".more-information");
		$(moreInfo).toggleClass('hidden');
		$(this).find('.more-information-arrow').find('.arrow-down').toggleClass('hidden');
		$(this).find('.more-information-arrow').find('.arrow-up').toggleClass('hidden');
	 });
	 
	$('input[name*=noPreferedArea').click(function(e) {
		if ($(this).is(':checked')) {
			$('[id^=preferedArea]').attr("required", false);
		} else {
			$('[id^=preferedArea]').attr("required", true);
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
				var jobId = $('input[name*=jobId]').val();
				if (jobId) {
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
		    	window.location.href = "success?municipalityJobApplication=false";
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