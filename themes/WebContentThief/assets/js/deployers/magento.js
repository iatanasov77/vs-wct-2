
var apiToken;
var apiBaseUrl;

export const authenticate = () => {
    
    let credentials = {
        "email": "api@example.com",
        "password": "sylius-api"
    };
    
    /**
     * Allow CORS Policy
     * -----------------
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
      "productTaxons": [
         "mens_jeans"
      ],
      "mainTaxon": "mens_jeans",
      "images": [
        "https://veloxsoftech.com/blog/wp-content/uploads/2019/01/symfony-new-logo.jpg"
      ],
      
      
      "channels": ["FASHION_WEB"],
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
        url: `${apiBaseUrl}/api/v2/admin/authentication-token`,
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
