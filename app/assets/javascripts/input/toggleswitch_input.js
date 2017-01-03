$( document ).on('turbolinks:load', function() {
  
  $('.onoffswitch-label').click(function(){ 
			
		 	$id = $(this).attr('for'); 
		 	if ($('#'+$id).val() == 1){ 
		 	  $('#'+$id).val(0) ;
		 	  $('#'+$id).prop('checked', false);
		 	}else{
		 		$('#'+$id).val(1) ;
		 		$('#'+$id).prop('checked', true);
		 	}
		 	
		});
})