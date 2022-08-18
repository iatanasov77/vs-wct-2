import * as vsConsole from '../includes/console';

var apiToken;
var apiBaseUrl;

export const authenticate = () => {
    
    let credentials = {
        "email": "api@example.com",
        "password": "sylius-api"
    };
    
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
        error: function () {
            alert( 'DEPLOYMENT ERROR !!!' );
        },
        
        // <- this turns it into synchronous
        // Execution is BLOCKED until request finishes.
        async: false
    });
}

function createProductRequest()
{
    let request = {
      "code": "TEST1",
      "translations": {
        "en_US": {
          "name": "API Product 1",
          "slug": "api-product-1",
          "locale": "en_US"
        }
      }
    };
    
    return request;
}

export const createProduct = () => {
    
    /**
     * Install This Package to Allow CORS Policy
     * ---------------------------------------------------
     * https://packagist.org/packages/nelmio/cors-bundle
     */
    $.ajax({
        url: `${apiBaseUrl}/api/v2/admin/products`,
        headers: {"Authorization": `Bearer ${apiToken}` },
        data: JSON.stringify( createProductRequest() ),
        contentType : 'application/json',
        type: "POST",
        dataType: "json",
        success: function ( response ) {
            console.log( response );
        },
        error: function () {
            alert( 'DEPLOYMENT ERROR !!!' );
        },
        
        // <- this turns it into synchronous
        // Execution is BLOCKED until request finishes.
        async: false
    });
}

export const deploy = ( baseUrl, repertory, mapperFields ) => {
    apiBaseUrl = baseUrl;
    if( ! apiToken ) {
        vsConsole.appendMessage( '#consoleDeployerBody', 'Starting Authenticate to Remote Host ...' );
        authenticate();
    }
    
    vsConsole.appendMessage( '#consoleDeployerBody', 'Starting Deploy Data ...' );
    for( let i = 0; i < repertory.length; i++ ) {
        vsConsole.appendMessage( '#consoleDeployerBody', 'Starting Deploy Item ' + ( i + 1 ) + ' ...' );
        console.log( repertory[i] );
    }
}
