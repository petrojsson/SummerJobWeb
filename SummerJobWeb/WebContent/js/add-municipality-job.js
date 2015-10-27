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
});

function appendMentor(){
	var mentorTemplate = $('#mentor-template').clone();			
	var uuid = generateUUID();
	mentorTemplate.find('input').each(function(){
		
		console.log(uuid);
		   var newName = $(this).attr('name');
		   newName=newName+'_'+uuid;
		   console.log(newName);
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