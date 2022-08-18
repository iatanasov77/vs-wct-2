



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
});
