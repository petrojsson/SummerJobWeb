/**
 * 
 */

$(document).ready(function(){
	
	$(document).on("submit",'form[name="match-worker"]',function(e){
		event.preventDefault();
		
		console.log("Adding application to job");
		
		var jobId = $('#job-id').val();
		var applicationId= $(this).find('input[name="application-id"]').val();
		 
		console.log(jobId);
		console.log(applicationId);
		
		var candidate =$(this).closest('.candidate');
		
		
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
	        		
	        		var temp = $('#matched-application-template').find('.matched-application').clone();
	        		console.log($(candidate).find('.name').text());
	        		$(temp).find('.name').text($(candidate).find('.name').text());
	        		$(temp).find('.social-number').text($(candidate).find('.social-number').text());	        		
	        		$(temp).find('input[name="application-id"]').val(applicationId);
	        		$('#matched-applications-container').append(temp);
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