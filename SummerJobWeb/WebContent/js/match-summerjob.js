/**
 * 
 */

$(document).ready(function(){
	
	$('.close-job-button').click(function(e) {
		var jobId = $('#job-id').val();
		adjustJobStatus(jobId, false);
	});
	
	$('.open-job-button').click(function(e) {
		var jobId = $('#job-id').val();
		adjustJobStatus(jobId, true);
	});
	
	$('.timeForInfo').datetimepicker({
		currentText: 'Nu',
		closeText: 'OK',
		timeText: 'Tid',
		controlType: 'select',
		oneLine: true,
		minDate: new Date(),
		stepMinute: 5,
	});
	
	$('button.generate-workplace-document-button').click(function(e) {
		e.preventDefault();
		var jobId = $('#job-id').val();
		generateWorkplaceDocuments(jobId);
	});

	$('button.save-application-options').click(function(e) {
		e.preventDefault();
		var jobId = $('#job-id').val();
		var applicationId = $(this).attr('id');
		var mentorId = $('#personal-mentor_' + applicationId).val();
		var timeForInfo = $('#timeForInfo_' + applicationId).val();
		var callStatus = $('#call-status_' + applicationId).val();
		saveApplicationOptions(jobId, applicationId, mentorId, timeForInfo, callStatus);
	});
	
	$('select.generate-document-select').change(function() {
		var id = $(this).attr('id').split("_")[1];
		var value = $(this).val();
		
		if (value.length == 0) {
			$('#generate-document_' + id).attr('disabled', true);
		} else {
			$('#generate-document_' + id).attr('disabled', false);
		}
	});
	
	$('button.generate-document-button').click(function(e) {
		e.preventDefault();
		var jobId = $('#job-id').val();
		var appId = $(this).attr('id').split("_")[1];
		var selectValue = $('#generate-document-select_' + appId).val();
		generateEmployeeDocument(jobId, appId, selectValue);
	});
	
	if ($('#jobIsOpenStatus').val() == 'false') {
		$('.common-button').attr('disabled', true);
	}
	
	$('.candidates input[name="application-id"]').change(function(e){
		 var ischecked= $(this).is(':checked');
         if(ischecked){
        	 var available = parseInt($("#availableToMatch").text())-1;
        	 $("#availableToMatch").text(available);
        	 if(available<=0){
        		 //disable all none checked        		 
        		 $('input[name="application-id"]').not(':checked').attr("disabled", true);
        	 }        	 
         }else{        	 
        	 var available = parseInt($("#availableToMatch").text())+1;
        	 $("#availableToMatch").text(available);
        	 
        	 if(available>0){
        		 $('input[name="application-id"]').not(':checked').removeAttr("disabled");
        	 }
         }
	});
	
	$(document).on("click", '.match-btn', function(e){
		e.preventDefault();
		
		console.log("Adding application to job");		
		var jobId = $('#job-id').val();
		data = $('input[name="application-id"]:checked');		
		console.log(jobId);
		data.push($('#job-id')[0]);
		console.log(data);
		
		 $.ajax(
		    {
		        url : url+'/match-worker.json',
		        type: "POST",
	
		        data: data,
		        success:function(data, textStatus, jqXHR) 
		        {
		        	console.log(data);
		        	if(data.status==='success'){
		        		console.log('application matching was successful');	        						        		
		        		location.reload(true);
		        	}else{
		        		console.log(data);
		        		alert(data.message);
		        	}
		        },
		        error: function(jqXHR, textStatus, errorThrown) 
		        {
		            console.log(textStatus);  
		        }
		    }
	    );

	});
	
	$('button.save-ranking-btn').click(function(e) {
		e.preventDefault();
		var appId = $(this).closest('.matched-application').find('input[name="applicationId"]').val();
		var rankingValue = $(this).closest('.matched-application').find('.ranking-input').val();
		updateApplicationRanking(appId, rankingValue);
	});

	$('a[name="show-more"]').click(function(){

		$(this).closest('.candidate').find('.collapse').collapse('show');
		$(this).hide();
		$(this).parent().find('a[name="show-less"]').show();
	});
	
	$('a[name="show-less"]').click(function(){
		
		$(this).closest('.candidate').find('.collapse').collapse('hide');
		$(this).hide();
		$(this).parent().find('a[name="show-more"]').show();
	});
	
	$('a[name="show-more-job-info"]').click(function(){

		$('.job-info').find('.collapse').collapse('show');
		$(this).hide();
		$(this).parent().find('a[name="show-less-job-info"]').show();
	});
	
	$('a[name="show-less-job-info"]').click(function(){
		
		$('.job-info').find('.collapse').collapse('hide');
		$(this).hide();
		$(this).parent().find('a[name="show-more-job-info"]').show();
	});
	
	$(document).on("click",'.remove-workers-btn',function(e){
		event.preventDefault();
		console.log("Removing application matched to job");
		console.log(this);
		var form = $('#matched-workers-form').serialize();
		console.log(form);
		console.log($(this).serialize());
		  
	    $.ajax(
	    {
	        url : url+'/remove-worker.json',
	        type: "POST",
	        data :  form,
	        success:function(data, textStatus, jqXHR) 
	        {
	        	console.log(data);
	        	if(data.status==='success'){
	        		console.log('application assignments was removed');
	        		location.reload(true);
	        	}else{
	        		console.log(data);
	        		alert(data.message);
	        	}
	        },
	        error: function(jqXHR, textStatus, errorThrown) 
	        {
	            console.log(textStatus);  
	        }
	    });
	});
	
	$(document).on("click",'.deny-btn',function(e){
		event.preventDefault();
		console.log("Denying applications");
		console.log(this);
		var form = $('#matched-workers-form').serialize();
		console.log(form);
		console.log($(this).serialize());
		  
	    $.ajax(
	    {
	        url : url+'/deny-workers.json',
	        type: "POST",
	        data :  form,
	        success:function(data, textStatus, jqXHR) 
	        {
	        	console.log(data);
	        	if(data.status==='success'){
	        		console.log('applications was changed from matched to denied.');
	        		location.reload(true);
	        	}else{
	        		console.log(data);
	        		alert(data.message);
	        	}
	        },
	        error: function(jqXHR, textStatus, errorThrown) 
	        {
	            console.log(textStatus);  
	        }
	    });
	});
	
	
	$(document).on("click",'.from-denied-to-matched-btn',function(e){
		event.preventDefault();
		console.log("Denying applications");
		
		var jobId = $('#job-id').val();		
		var form = $('#denied-workers-form').find("input:checkbox[name=application-id]:checked");
		
		
		console.log(form);
		
		  
	    $.ajax(
	    {
	    	url : url+'/match-worker.json',
	        type: "POST",
	        data : form.serialize()+'&job-id='+jobId,
	        success:function(data, textStatus, jqXHR) 
	        {
	        	console.log(data);
	        	if(data.status==='success'){
	        		console.log('applications was changed from denied to matched.');
	        		location.reload(true);
	        	}else{
	        		console.log(data);
	        		alert(data.message);
	        	}
	        },
	        error: function(jqXHR, textStatus, errorThrown) 
	        {
	            console.log(textStatus);  
	        }
	    });
	});
});

function saveApplicationOptions(jobId, applicationId, mentorId, timeForInfo, callStatus) {
	 $.ajax({
    	url : url + '/save/applicationoptions.json',
        type: "POST",
        data: { jobId : jobId, appId : applicationId, mentorId : mentorId, timeForInfo : timeForInfo, callStatus : callStatus },
        success: function(data, textStatus, jqXHR) {
        	console.log(data);
        	if(data.status === 'success'){
        		console.log('Saved application options');
        		location.reload(true);
        	} else {
        		console.log(data);
        		alert(data.message);
        	}
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.log(textStatus);  
        }
    });
}

function generateWorkplaceDocuments(jobId) {
	var form = document.createElement("form");
	form.method = "post";
	form.action = url + "?jobId=" + jobId + "&generateWorkDocument=true";
	document.body.appendChild(form);
	form.submit();
	document.body.removeChild(form);
}

function generateEmployeeDocument(jobId, applicationId, selectValue) {
	var form = document.createElement("form");
	form.method = "post";
	form.action = url + "?jobId=" + jobId + "&appId=" + applicationId + "&selectValue=" + selectValue;
	document.body.appendChild(form);
	form.submit();
	document.body.removeChild(form);
}

function updateApplicationRanking(applicationId, rankingValue) {
	 $.ajax({
		url : url + '/save/applicationranking.json',
	    type: "POST",
	    data: { appId : applicationId, ranking : rankingValue },
	    success: function(data, textStatus, jqXHR) {
	    	console.log(data);
	    	if(data.status === 'success'){
	    		location.reload(true);
	    	} else {
	    		console.log(data);
	    	}
	    },
	    error: function(jqXHR, textStatus, errorThrown) {
	        console.log(textStatus);  
	    }
	});
}

function adjustJobStatus(jobId, newIsOpenStatus) {
	 $.ajax({
		url : url + '/adjustjobstatus.json',
	    type: "POST",
	    data: { jobId : jobId, newStatus : newIsOpenStatus },
	    success: function(data, textStatus, jqXHR) {
	    	console.log(data);
	    	if(data.status === 'success'){
	    		location.reload(true);
	    	} else {
	    		console.log(data);
	    	}
	    },
	    error: function(jqXHR, textStatus, errorThrown) {
	        console.log(textStatus);  
	    }
	});
}
