require( 'jquery-easyui/css/easyui.css' );
require( 'jquery-easyui/js/jquery.easyui.min.js' );
require ( 'jquery-duplicate-fields/jquery.duplicateFields.js' );

require( '../../css/mapper.css' );

$( function ()
{
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
    
    $( '#btnSaveMapper' ).on( 'click', function( e )
    {
        var data    = $( '#formCreateMapper' ).serialize();
        
        $.ajax({
            url: $( '#formCreateMapper' ).attr( 'action' ),
            type: "POST",
            data: data,
            success: function ( response ) {
                document.location = document.location;
            },
            error: function () {
                alert( 'CREATE MAPPER ERROR !!!' );
            }
        });
    });
    
    $( '.mapperFieldsContainer' ).duplicateFields({
        btnRemoveSelector: ".btnRemoveField",
        btnAddSelector:    ".btnAddField",
        onCreate: function( newElement ) {
            newElement.find( '.mapperMapFieldCombo' ).first().combotree();
        }
    });
});
