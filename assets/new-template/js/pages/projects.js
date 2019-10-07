$( function ()
{
	$(".btnDelete").on( "click", function ( e ) 
	{
	    e.preventDefault();

	    $( "<div>Do you want to delete this Project?</div>" ).dialog({
	        buttons: {
	            "Ok": function () {
	                window.location = $(this).href;
	            },
	            "Cancel": function () {
	                $(this).dialog( "close" );
	            }
	        }
	    });
	});
});
