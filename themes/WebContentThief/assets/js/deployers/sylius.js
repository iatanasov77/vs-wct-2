
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
            alert( "TOKEN: " + response.token );
            apiToken    = response.token;
        },
        error: function () {
            alert( 'DEPLOYMENT ERROR !!!' );
        }
    });
}

export const createProduct = () => {
    let product = {
      "code": "TEST1",
      "translations": {
        "en_US": {
          "name": "API Product 1",
          "slug": "api-product-1",
          "locale": "en_US"
        }
      }
    };
    
    $.ajax({
        url: `${apiBaseUrl}/api/v2/admin/products`,
        headers: {"Authorization": `Bearer ${apiToken}` },
        data: JSON.stringify( product ),
        contentType : 'application/json',
        type: "POST",
        dataType: "json",
        success: function ( response ) {
            console.log( response );
        },
        error: function () {
            alert( 'DEPLOYMENT ERROR !!!' );
        }
    });
}

export const deploy = ( baseUrl ) => {
    apiBaseUrl = baseUrl;
    if( ! apiToken ) {
        authenticate();
    }
}
