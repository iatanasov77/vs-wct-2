function showSpinner()
{
	
	//$( '#remoteBrowser' ).before( html );
}

$(function () { 
    $('.btnBrowse').on('click', function ()
    {
    	showSpinner();
    	
        var browserUrl = $(this).attr('data-browserUrl');
        var url = $($(this).attr('data-urlInput')).val();
        
        if(url.length) {
            $('#remoteBrowser').attr('src', browserUrl + '?url=' + encodeURIComponent(url));
        }
    });

    $('#remoteBrowser').on('load', function () {
        var cssUrl = $(this).attr('data-browserCss');
        var head = $(this).contents().find("head");
        head.append($("<link/>", {rel: "stylesheet", href: cssUrl, type: "text/css"}));

        $('*', this.contentWindow.document).click(function (e) {
            e.preventDefault();
            e.stopPropagation();

            $('.parserMarker').removeClass('parserMarker');
            $(this).addClass('parserMarker');

            var xpath = getXPath(this);
            
            $("#project_xquery", parent.document).val(xpath);
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
    
    $('#btnAddFields').on('click', function() {
        var projectId = $(this).attr('data-projectId');
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

