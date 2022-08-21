import * as vsConsole from '../includes/console';

var apiToken;
var apiBaseUrl;

function createProduct( productRequest )
{
    /**
     * Install This Package to Allow CORS Policy
     * ---------------------------------------------------
     * https://packagist.org/packages/nelmio/cors-bundle
     */
    $.ajax({
        url: `${apiBaseUrl}/api/v2/admin/products`,
        headers: {"Authorization": `Bearer ${apiToken}` },
        data: JSON.stringify( productRequest ),
        contentType : 'application/json',
        type: "POST",
        dataType: "json",
        success: function ( response ) {
            console.log( response );
        },
        error: function ( XMLHttpRequest, textStatus, errorThrown ) {
            alert( XMLHttpRequest.status + ': ' + XMLHttpRequest.responseText );
        },
        
        // <- this turns it into synchronous
        // Execution is BLOCKED until request finishes.
        async: false
    });
}

function deleteProduct( productCode )
{
    /**
     * Install This Package to Allow CORS Policy
     * ---------------------------------------------------
     * https://packagist.org/packages/nelmio/cors-bundle
     */
    $.ajax({
        url: `${apiBaseUrl}/api/v2/admin/products/${productCode}`,
        headers: {"Authorization": `Bearer ${apiToken}` },
        contentType : 'application/json',
        type: "DELETE",
        dataType: "json",
        success: function ( response ) {
            console.log( response );
        },
        // https://stackoverflow.com/questions/6792878/jquery-ajax-error-function
        error: function ( XMLHttpRequest, textStatus, errorThrown ) {
            alert( XMLHttpRequest.status + ': ' + XMLHttpRequest.responseText );
        },
        
        // <- this turns it into synchronous
        // Execution is BLOCKED until request finishes.
        async: false
    });
}

export const authenticate = ( credentials ) => {
    
    /**
     * Install This Package to Allow CORS Policy
     * ---------------------------------------------------
     * https://packagist.org/packages/nelmio/cors-bundle
     */
    $.ajax({
        url: `${apiBaseUrl}/api/v2/admin/authentication-token`,
        data: JSON.stringify( credentials ),
        contentType : 'application/json',
        type: "POST",
        dataType: "json",
        success: function ( response ) {
            //alert( "TOKEN: " + response.token );
            apiToken    = response.token;
        },
        error: function ( XMLHttpRequest, textStatus, errorThrown ) {
            alert( XMLHttpRequest.status + ': ' + XMLHttpRequest.responseText );
        },
        
        // <- this turns it into synchronous
        // Execution is BLOCKED until request finishes.
        async: false
    });
}

export const deployProducts = ( apiHost, productsRequests ) => {
    apiBaseUrl = apiHost.baseUrl;
    if( ! apiToken ) {
        vsConsole.appendMessage( '#consoleDeployerBody', 'Starting Authenticate to Remote Host ...' );
        authenticate( apiHost.credentials );
    }
    
    vsConsole.appendMessage( '#consoleDeployerBody', 'Starting Deploy Data ...' );
    for( let i = 0; i < productsRequests.length; i++ ) {
        vsConsole.appendMessage( '#consoleDeployerBody', 'Starting Deploy Item ' + ( i + 1 ) + ' ...' );
        
        createProduct( productsRequests[i] );
    }
}

export const deleteProducts = ( apiHost, productsRequests ) => {
    apiBaseUrl = apiHost.baseUrl;
    if( ! apiToken ) {
        vsConsole.appendMessage( '#consoleDeployerBody', 'Starting Authenticate to Remote Host ...' );
        authenticate( apiHost.credentials );
    }
    
    vsConsole.appendMessage( '#consoleDeployerBody', 'Starting Delete Products ...' );
    for( let i = 0; i < productsRequests.length; i++ ) {
        vsConsole.appendMessage( '#consoleDeployerBody', 'Starting Delete Item ' + ( i + 1 ) + ' ...' );
        
        deleteProduct( productsRequests[i].code );
    }
}
