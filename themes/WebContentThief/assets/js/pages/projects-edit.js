require( 'bootstrap-sass' );
require ( 'jquery-duplicate-fields/jquery.duplicateFields.js' );

import { WctProjectFields } from '../includes/wct_project_fields.js';
import { initWctProjectFields } from '../includes/wct_project_fields.js';

function createFields( fields )
{
    var prototype   = '';
    for ( var i = 0; i < fields.length; i++ ) {
      prototype += '<div class="input-group mb-2">' + 
                    '<label class="col-sm-2 control-label">' + fields[i].title + ':</label>' + 
                    '<div class="col-sm-6"><input type="text" class="form-control" id="' + fields[i].id + '_source" data-target="#' + fields[i].id + '" value="' + fields[i].xpath + '" /></div>' + 
                    '</div>';
    }
    
    return prototype;
}

function createFieldsSelectOptions( fields )
{
    var options     = '';
    for (var i = 0; i < fields.length; i++) {
      options   += '<option value="' + fields[i].id + '_source">' + fields[i].title + '</option>';
    }
    
    return options;
}

$( function ()
{
    $( '.fieldsContainer' ).duplicateFields({
        btnRemoveSelector: ".btnRemoveField",
        btnAddSelector:    ".btnAddField"
    });
    
    $( '.btnTestBrowse' ).on( 'click', function (e)
    {
        e.preventDefault();
        $( '#project_form_url' ).val( $( this ).attr( 'href' ) );
        $( '#btnBrowseListingUrl' ).click();
    });
    
	$( '.btnBrowseUrl' ).on( 'click', function ()
	{
        var fieldsetId  = '#fieldsetProjectListingFields';
        var fields      = initWctProjectFields( fieldsetId ).getFields();
        
	    var browseUrl  = $( '#project_form_url' ).val();
	    if ( browseUrl.length ) {
	        $( '#urlInput' ).val( browseUrl );
	        $( '#ModalBrowser_BtnBrowse' ).click();
	    }
		$( '#browser-spinner' ).hide();
		
		$( '#fieldsContainer' ).attr( 'data-listingContainerElement', $( '#project_form_listingContainerElement' ).val() );
		
        $('#fieldsContainer').html( '' );
        $('#fieldsContainer').append( createFields( fields ) );
        
        $('#project_xqueryField').html( '' );
        $('#project_xqueryField').html( createFieldsSelectOptions( fields ) );
		
		$( '#project_fieldsContainer' ).val( fieldsetId );
	});
	
	$( '.btnBrowseDetails' ).on( 'click', function ()
    {
        var fieldsetId  = '#fieldsetProjectDetailsFields';
        var fields      = initWctProjectFields( fieldsetId ).getFields();
        
        var browseUrl  = $( this ).attr( 'data-url' );
        if ( browseUrl.length ) {
            $( '#urlInput' ).val( browseUrl );
            $( '#ModalBrowser_BtnBrowse' ).click();
        }
        $( '#browser-spinner' ).hide();

        $('#fieldsContainer').html( '' );
        $('#fieldsContainer').append( createFields( fields ) );
        
        $('#project_xqueryField').html( '' );
        $('#project_xqueryField').html( createFieldsSelectOptions( fields ) );
        
        $( '#project_fieldsContainer' ).val( fieldsetId );
    });
    
    $( '.btnDisplayCollector' ).on( 'click', function () {
        $( "#consoleCollectData" ).hide();
        
        $( "#CollectDataContainer" ).html( '' );
        //$( "#modalCollectorProgress" ).modal( 'show' );
        
        // EVENTS
        $( "#modalCollectorProgress" ).on( 'hidden.bs.modal', function () {
            window.location.reload();
        });
    });
    
    
    
    
/*
    $( '#project_addFieldset_button' ).on( 'click', function() {
        var fieldsetId      = $( '#project_addFieldset_fieldset' ).val();
        var destinationPage = $( '#project_addFieldset_destination' ).val();

        var destination     = projectFieldsDestinations[destinationPage];
        var url             = $(this).attr( 'data-getFieldsUrl' ) + '?id=' + fieldsetId;
        
        $.ajax({
            type: 'post',
            dataType: 'json',
            url: url,
            data: {
                id: fieldsetId
            },
            success: function(data) {
                for ( i = 0; i < data.length; i++ ) {
                    createDfElement( destination, data[i], destinationPage );
                }
                initDfButtons( destination );
            }
        });
    });
*/
    
    
});
