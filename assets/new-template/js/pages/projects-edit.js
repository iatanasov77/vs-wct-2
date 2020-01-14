$( function ()
{ 
	$( "#btnSaveFieldsXquery" ).on( "click", function( e )
	{
		e.preventDefault(); // prevent de default action, which is to submit
	  
		// Copy fields
		$( '#fieldsContainer' ).find( 'input' ).each( function ()
		{
			$( $(this).attr( 'data-target' ) ).val( $(this).val() );
		});
	  
		$( '#btnCloseBrowser' ).click();
	});
	
	$( '.btnOpenBrowser' ).on( 'click', function ()
	{
		alert( 'btnOpenBrowser' );
	});
	
    $('.btnBrowse').on('click', function ()
    {
    	$( '#browser-spinner' ).show();
    	
        var browserUrl	= $(this).attr('data-browserUrl');
        var url			= $($(this).attr('data-urlInput')).val();
        var fields		= JSON.parse($(this).attr('data-fields'));
        if ( ! url.length || ! fields.length ) {
        	
        	alert( 'URL or Fields are not defined!' );
        	return false;
        }
        
        $('#remoteBrowser').attr('src', browserUrl + '?url=' + encodeURIComponent(url));
        
        var prototype	= '';
        var options		= '';
        for (var i = 0; i < fields.length; i++) {
          prototype += '<div class="input-group">' + '<label class="col-sm-1 control-label">' + fields[i].title + ':</label>' + '<div class="col-sm-6"><input type="text" class="form-control" id="' + fields[i].id_source + '" data-target="#' + fields[i].id_target + '" /></div>' + '</div>';
          options	+= '<option value="' + fields[i].id_source + '">' + fields[i].title + '</option>';
        }

        $('#fieldsContainer').html('');
        $('#fieldsContainer').append(prototype);
        
        $('#project_xqueryField').html('');
        $('#project_xqueryField').html(options);
    });

    $('#remoteBrowser').on('load', function () {
    	$( '#browser-spinner' ).hide();
    	
        var cssUrl = $(this).attr('data-browserCss');
        var head = $(this).contents().find("head");
        head.append($("<link/>", {rel: "stylesheet", href: cssUrl, type: "text/css"}));

        $('*', this.contentWindow.document).click(function (e) {
            e.preventDefault();
            e.stopPropagation();

            $('.parserMarker').removeClass('parserMarker');
            $(this).addClass('parserMarker');

            var xpath = getXPath(this);
            
            var whereToSet	= $('#project_xqueryField').val();
            $("#" + whereToSet, parent.document).val( xpath );
        });
    });
    
    $('.fieldsContainer').duplicateFields({
        btnRemoveSelector: ".btnRemoveField",
        btnAddSelector:    ".btnAddField"
    });
    
    $('#btnSetXquery').on('click', function() {
        var xquery = $('#project_xquery').val();
        if(!xquery.length)
            return;
        
        var fieldId = $('#project_xqueryField').val();
        $('#'+fieldId).val(xquery);
    });
    
    $('#btnAddFieldsListing').on('click', function() {
        var projectId = $(this).attr('data-resourceId');
        var fieldsetId = $('#FormProject_fieldset').val();
        var url = $(this).attr('data-addFieldsUrl');
        
        $.ajax({
            type: 'post',
            dataType: 'json',
            url: url,
            data: {
                projectId: projectId,
                fieldsetId: fieldsetId
            },
            success: function(data) {
                document.location = document.location;
            }
        });
    });
    
    $('#btnAddFieldsDetails').on('click', function() {
        var projectId = $(this).attr('data-resourceId');
        var fieldsetId = $('#FormProject_fieldset').val();
        var url = $(this).attr('data-addFieldsUrl');
        
        $.ajax({
            type: 'post',
            dataType: 'json',
            url: url,
            data: {
                projectId: projectId,
                fieldsetId: fieldsetId
            },
            success: function(data) {
                document.location = document.location;
            }
        });
    });
    
    $('.boxProjectMapping').each(function() {
        var url = $(this).attr('data-formUrl');
        var data = {
            'processorId': $(this).attr('data-processorId')
        };

        var box = $(this);
        $.get(url, data, function(data) {
            box.html(data);
        });
    });
    
    $('#mappings').on('click', '.btnSaveMappings', function(e) {
        e.preventDefault();
        
        var url = $(this).attr('href');
        var data = $(this).closest('.panel-body').find('select').serialize();
        
        $.post(url, data, function(data) {
            
        });
    });
});



/**
 * Gets an XPath for an element which describes its hierarchical location.
 */
function getXPath(element) {
    var paths = [];

    // Use nodeName (instead of localName) so namespace prefix is included (if any).
    for (; element && element.nodeType == 1; element = element.parentNode) {
        var index = 0;
        // EXTRA TEST FOR ELEMENT.ID
        if (element && element.id) {
            paths.splice(0, 0, '/*[@id="' + element.id + '"]');
            break;
        }

        for (var sibling = element.previousSibling; sibling; sibling = sibling.previousSibling) {
            // Ignore document type declaration.
            if (sibling.nodeType == Node.DOCUMENT_TYPE_NODE)
                continue;

            if (sibling.nodeName == element.nodeName)
                ++index;
        }

        var tagName = element.nodeName.toLowerCase();
        var pathIndex = (index ? "[" + (index + 1) + "]" : "");
        paths.splice(0, 0, tagName + pathIndex);
    }

    return paths.length ? "/" + paths.join("/") : null;
};

