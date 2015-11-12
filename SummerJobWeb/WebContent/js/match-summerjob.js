/**
 * 
 */

$(document).ready(function(){
	
	$(document).on("submit",'form[name="add-worker"]',function(e){
		event.preventDefault();
		
		console.log("Adding application to job");
		
		var jobId = $('#job-id').val();
		var applicationId= $(this).find('input[name="application-id"]').val();
		 
		console.log(jobId);
		console.log(applicationId);
		
		var candidate =$(this).closest('.candidate');
		
		
	    $.ajax(
	    {
	        url : url+'/add-worker.json',
	        type: "POST",
	        data : {"application-id":applicationId, "job-id":jobId},
	        success:function(data, textStatus, jqXHR) 
	        {
	        	console.log(data);
	        	if(data.status==='success'){
	        		console.log('application assignment was created');	        		
	        		
	        		var temp = $('#assigned-application-template').find('.assigned-application').clone();
	        		console.log($(candidate).find('.name').text());
	        		$(temp).find('.name').text($(candidate).find('.name').text());
	        		$(temp).find('.social-number').text($(candidate).find('.social-number').text());
	        		console.log($(temp).find('.application-id'));
	        		console.log($(temp).find('.application-id').val());
	        		$(temp).find('input[name="application-id"]').val(applicationId);
	        		$('#assigned-applications-container').append(temp);
	        		candidate.fadeOut('slow');
	        		candidate.remove();
	        		
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
	
	$(document).on("submit",'#remove-workers-form',function(e){
		event.preventDefault();
		console.log("Removing application assigned to job");
		console.log(this);
		
		console.log($(this).serialize());
		 
		 var removeApp =$(this).closest('.assigned-application'); 
	    $.ajax(
	    {
	        url : url+'/remove-worker.json',
	        type: "POST",
	        data :  $(this).serialize(),
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
	
	$('a[name="show-more"]').click(function(){
		console.log('click');
		$(this).closest('.candidate').find('.collapse').collapse('show');
		$(this).hide();
		$('a[name="show-less"]').show();
	});
	
	$('a[name="show-less"]').click(function(){
		console.log('click');
		$(this).closest('.candidate').find('.collapse').collapse('hide');
		$(this).hide();
		$('a[name="show-more"]').show();
	});
	
	
	
});