$( function()
{
    $( '#btnRunCollector' ).on( 'click', function () {
        $( "#btnCloseCollectorProgress" ).hide();
        $( '#formCollectData' ).submit();
        $( this ).hide();
    });

    $( '#formCollectData' ).on( 'submit', function()
    {
        var url     = $( "#modalCollectorProgress" ).attr( 'data-actionUrl' );
        var data    = $( this ).serializeArray();
        
        $( "#lablePhpVersion" ).text( 'Install PHP: ' + data[0].value );
        
        $( "#formCollectData" ).hide( 1000 );
        $( "#consoleCollectData" ).show();
        
        //console.log( data );
        //return false;

        var lastResponseLength  = false;
        $.ajax({
            method: 'POST',
            url: url,
            data: data,
            xhrFields: {
                // Getting on progress streaming response
                onprogress: function( e )
                {
                    var progressResponse;
                    var response    = e.currentTarget.response;
                    if( lastResponseLength === false ) {
                        //$( "#commandPhpVersion" ).html( response );
                        
                        progressResponse    = response;
                        lastResponseLength  = response.length;
                    } else {
                        progressResponse    = response.substring( lastResponseLength );
                        lastResponseLength  = response.length;
                    }
                    
                    // In My Case
                    $( "#CollectDataContainer" ).append( progressResponse ).animate( {scrollTop: $( '#CollectDataContainer' ).prop( "scrollHeight" ) }, 0 );
                    
                    if ( progressResponse == '' ) {
                        
                    }
                }
            }
        })
        .done( function( html ) {
        /*
            var setupUrl    = "/php-versions/" + data[0].value + "/setup";
            var startUrl    = "/php-versions/" + data[0].value + "/start-fpm";
            $.get( setupUrl, function( response ) {
                $( "#phpInstallContainer" ).append( '<br><br>PhpFpm Setup is Done!<br>' ).animate( {scrollTop: $( '#phpInstallContainer' ).prop( "scrollHeight" ) }, 0 );
                $.get( startUrl, function( response ) {
                    $( "#phpInstallContainer" ).append( 'PhpFpm is Started!<br>' ).animate( {scrollTop: $( '#phpInstallContainer' ).prop( "scrollHeight" ) }, 0 );
                });
            });
        */
            //$( "#btnCloseCollectorProgress" ).text( 'Close' );
            $( "#btnCloseCollectorProgress" ).show();
        })
        .fail( function() {
            alert( "AJAX return an ERROR !!!" );
        });
        
        return false;
    });
    
    
});
