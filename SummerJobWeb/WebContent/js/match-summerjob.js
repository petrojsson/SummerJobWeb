/**
 * 
 */

$(document).ready(function(){
	
	$('.timeForInfo').datetimepicker({
		currentText: 'Nu',
		closeText: 'OK',
		timeText: 'Tid',
		controlType: 'select',
		oneLine: true,
		minDate: new Date(),
		stepMinute: 5,
	});

	
	$('button.save-personal-mentor').click(function(e) {
		e.preventDefault();
		var jobId = $('#job-id').val();
		var applicationId = $(this).attr('id');
		var mentorId = $('#personal-mentor_' + applicationId).val();
		savePersonalMentor(jobId, applicationId, mentorId);
	});
	
	if ($('#availableSlotsToMatch').html() == '0') {
		$('.set-matched-btn').attr('disabled', true);
	}
	
	$(document).on("submit", 'form[name="match-worker"]', function(e){
		e.preventDefault();
		
		console.log("Adding application to job");
		
		var jobId = $('#job-id').val();
		var applicationId= $(this).find('input[name="application-id"]').val();
		 
		console.log(jobId);
		console.log(applicationId);
		
//		var candidate = $(this).closest('.candidate');
		
	    $.ajax(
	    {
	        url : url+'/match-worker.json',
	        type: "POST",
	        data : {"application-id":applicationId, "job-id":jobId},
	        success:function(data, textStatus, jqXHR) 
	        {
	        	console.log(data);
	        	if(data.status==='success'){
	        		console.log('application matching was successful');	        		
	        		
//	        		var temp = $('#matched-application-template').find('.matched-application').clone();
//	        		console.log($(candidate).find('.name').text());
//	        		$(temp).find('.name').text($(candidate).find('.name').text());
//	        		$(temp).find('.social-number').text($(candidate).find('.social-number').text());	        		
//	        		$(temp).find('input[name="application-id"]').val(applicationId);
//	        		$('#matched-applications-container').append(temp);
//	        		candidate.remove();
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
		var applicationId= $('#denied-workers-form').find('input[name="application-id"]').val();
		console.log(applicationId);
		var form = $('#denied-workers-form');
		form['job-id']=jobId;
		
		console.log(form);
		
		  
	    $.ajax(
	    {
	    	url : url+'/match-worker.json',
	        type: "POST",
	        data : {'application-id':applicationId,'job-id':jobId},
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

function savePersonalMentor(jobId, applicationId, mentorId) {
	 $.ajax({
    	url : url + '/save/personalmentor.json',
        type: "POST",
        data: { jobId : jobId, appId : applicationId, mentorId : mentorId },
        success: function(data, textStatus, jqXHR) {
        	console.log(data);
        	if(data.status === 'success'){
        		console.log('Saved personal mentor.');
        		location.reload(true);
        	}else{
        		console.log(data);
        		alert(data.message);
        	}
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.log(textStatus);  
        }
    });
}
