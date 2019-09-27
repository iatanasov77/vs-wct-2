"use strict";

$( function() {
	$("#btnDelete").on("click", function (e) {
	    var link = this;
	    e.preventDefault();

	    $("<div>Do you want to delete this Item?</div>").dialog({
	        buttons: {
	            "Ok": function () {
	                window.location = link.href;
	            },
	            "Cancel": function () {
	                $(this).dialog("close");
	            }
	        }
	    });
	});
});
