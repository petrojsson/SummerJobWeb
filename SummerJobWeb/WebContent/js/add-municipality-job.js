/**
 * New node file
 */

$(document).ready(function(){
	if($('.add-mentor-btn')){		
		$('.add-mentor-btn').click(function(e){
			e.preventDefault();
			$('#mentors-wrapper').append($('#mentor-template').html());			
		});
	}	
});