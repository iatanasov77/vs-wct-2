require( 'jquery-xpath/jquery.xpath.js' );

import { VsSpinnerShow, VsSpinnerHide } from '@/js/includes/VsSpinner/vs_spinner.js';

/**
 * Gets an XPath for an element which describes its hierarchical location.
 */
function getXPath( element )
{
    var paths           = [];
    var containerXpath  = $( '#fieldsContainer' ).attr( 'data-listingContainerElement' );

    // Use nodeName (instead of localName) so namespace prefix is included (if any).
    for ( ; element && element.nodeType == Node.ELEMENT_NODE; element = element.parentNode ) {
        var index = 0;
        
        if ( containerXpath && containerXpath.length ) {
            if ( $( $( '#remoteBrowser' )[ 0 ].contentWindow.document ).xpath( containerXpath ).html() == $( element ).html() ) {
                var baseXPath   = containerXpath.substring( 1 ); // Delete first character of a string
                paths.splice( 0, 0, baseXPath );
                break;
            }
        } else {
            // EXTRA TEST FOR ELEMENT.ID
            if ( element && element.id ) {
                paths.splice( 0, 0, '/*[@id="' + element.id + '"]' );
                break;
            }
        }
        
        for ( var sibling = element.previousSibling; sibling; sibling = sibling.previousSibling ) {
            // Ignore document type declaration.
            if ( sibling.nodeType == Node.DOCUMENT_TYPE_NODE )
                continue;

            if ( sibling.nodeName == element.nodeName )
                ++index;
        }

        var tagName = element.nodeName.toLowerCase();
        var pathIndex = ( index ? "[" + ( index + 1 ) + "]" : "" );
        paths.splice( 0, 0, tagName + pathIndex );
    }

    return paths.length ? "/" + paths.join( "/" ) : null;
};
    
$( function ()
{
    $( '.btnBrowse' ).on( 'click', function ()
    {
        //$( '#browser-spinner' ).show();
        VsSpinnerShow( 'remoteBrowser' );
        
        var browserUrl  = $( this ).attr( 'data-browserUrl' );
        var remoteUrl   = $( $( this ).attr( 'data-urlInput' ) ).val();
        
        if ( ! remoteUrl.length ) {
            alert( 'URL is empty!' );
            
            return false;
        }
        
        $( '#remoteBrowser' ).attr( 'src', browserUrl + '?url=' + encodeURIComponent( remoteUrl ) );
        //$( '#remoteBrowser' ).attr( 'src', remoteUrl );
    });

    $( '#remoteBrowser' ).on( 'load', function ()
    {
        //$( '#browser-spinner' ).hide();
        VsSpinnerHide( 'remoteBrowser' );
        
        var cssUrl = $( this ).attr( 'data-browserCss' );
        var head = $( this ).contents().find( "head" );
        head.append( $( "<link/>", {rel: "stylesheet", href: cssUrl, type: "text/css" } ) );
        
        $( '*', this.contentWindow.document ).hover(
            function() { $( this ).addClass( "parserHover" ); },
            function() { $( this ).removeClass( "parserHover" ); }
        );
    
        $( '*', this.contentWindow.document ).click( function ( e )
        {
            e.preventDefault();
            e.stopPropagation();

            $( '#remoteBrowser' ).contents().find( '.parserMarker' ).removeClass( 'parserMarker' );
            $( this ).addClass( 'parserMarker' );
            var xpath = getXPath( this );
            
            var whereToSet  = $( '#project_xqueryField' ).val();
            $( "#" + whereToSet, parent.document ).val( xpath );
            
            $( '#browserLogContainer' ).append( $( "<p class='card-text'>" + xpath + "</p>" ) );
            $( '#browserLogContainer' ).scrollTop( $( '#browserLogContainer' ).prop( "scrollHeight" ) );
        });
    });
        
    $('#btnSetXquery').on('click', function() {
        var xquery = $('#project_xquery').val();
        if(!xquery.length)
            return;
        
        var fieldId = $('#project_xqueryField').val();
        $('#'+fieldId).val(xquery);
    });
    

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
});
