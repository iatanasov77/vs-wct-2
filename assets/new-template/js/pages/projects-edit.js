/*
{
	id_source: "project_pagerLink_source"
	id_target: "project_pagerLink"
	title: "Pager Link"
}

project_listingFields_2_xquery
 */
class ProjectFields
{
	constructor(  )
	{
		this.fields	= [];
	}
	
	getFields() {
		return this.fields;
 	}
	
	addField( field )
	{
		
	}
}

var dfOptions	= {
    btnRemoveSelector: ".btnRemoveField",
    btnAddSelector:    ".btnAddField"
};

function initDfButtons( container )
{
    container.find( dfOptions.btnRemoveSelector ).show();
    container.find( dfOptions.btnRemoveSelector ).last().hide();
    container.find( dfOptions.btnAddSelector ).hide();
    container.find( dfOptions.btnAddSelector ).last().show();
}

function createDfElement( container, data, fields )
{
    var elementNumber = container.children().length + 1;
    var newElement = $(container.attr('data-prototype'));
    
    newElement.find( '#project_listingFields___name___title' ).val( data.title );
    newElement.find( '#project_listingFields___name___type' ).val( data.type );
    
    newElement.find(':input').each(function() {
        var id = $(this).attr('id').replace('__name__', elementNumber);
        $(this).attr('id', id);
        
        if ( id.endsWith( '_xquery' ) ) {
        	fields.addField({
				id_source: id + "_source",
				id_target: id,
				title: data.title
			});
        }
        
        var name = $(this).attr('name').replace('__name__', elementNumber);
        $(this).attr('name', name);
    });
    container.append(newElement);
    
    return newElement;
}

$( function ()
{
	$('.fieldsContainer').duplicateFields( dfOptions );
	
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
		$( '#browser-spinner' ).hide();
		
		var fields		= JSON.parse($(this).attr('data-fields'));

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
	
    $('.btnBrowse').on('click', function ()
    {
    	$( '#browser-spinner' ).show();
    	
        var browserUrl	= $(this).attr('data-browserUrl');
        var url			= $($(this).attr('data-urlInput')).val();
        
        if ( ! url.length ) {
        	alert( 'URL is empty!' );
        	
        	return false;
        }
        
        $('#remoteBrowser').attr('src', browserUrl + '?url=' + encodeURIComponent(url));
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
        
    $('#btnSetXquery').on('click', function() {
        var xquery = $('#project_xquery').val();
        if(!xquery.length)
            return;
        
        var fieldId = $('#project_xqueryField').val();
        $('#'+fieldId).val(xquery);
    });
    
    $('#btnAddFieldsListing').on('click', function() {
        var fieldsetId	= $('#project_fieldsetListing').val();
        var url			= $(this).attr('data-getFieldsUrl') + '?id=' + fieldsetId;
        
        $.ajax({
            type: 'post',
            dataType: 'json',
            url: url,
            data: {
                id: fieldsetId
            },
            success: function(data) {
            	for ( i = 0; i < data.length; i++ ) {
            		createDfElement( $( '#fieldsListingContainer' ), data[i] );
            	}
            	
            	initDfButtons( $( '#fieldsListingContainer' ) )
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

