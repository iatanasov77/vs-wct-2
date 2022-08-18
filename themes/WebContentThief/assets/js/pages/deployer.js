import { VsPath } from '../includes/fos_js_routes.js';

import * as sylius from '../deployers/sylius';
import * as magento from '../deployers/magento';
import * as prestashop from '../deployers/prestashop';

function deploy( deployer, baseUrl, repertory )
{
    switch ( deployer ) {
        case 'sylius':
            sylius.deploy( baseUrl );
            break;
        case 'magento':
            magento.deploy( baseUrl );
            break;
        case 'prestashop':
            prestashop.deploy( baseUrl );
            break;
        default:
            alert( "Deployer '" + deployer + "' is Not Available !!!" );
    }
}

$( function ()
{
    $( '.btnDisplayDeployer' ).on( 'click', function( e )
    {
        $( '#project_deployer_form_repertoryId' ).val( $( this ).attr( 'data-repertoryId' ) );
    });
    
    $( '#btnRunDeployer' ).on( 'click', function( e )
    {
        let deployer    = $( '#project_deployer_form_deployer' ).val();
        let baseUrl     = $( '#project_deployer_form_baseUrl' ).val();
        let repertory   = $( '#project_deployer_form_repertoryId' ).val();
        
        $.ajax({
            url: VsPath( 'vs_wct_project_json_repertory', { 'id': repertory } ),
            type: "GET",
            success: function ( response ) {
                alert( "TOKEN: " + response.token );
                apiToken    = response.token;
            },
            error: function () {
                alert( 'GET REPERTORY ERROR !!!' );
            }
        });
    
        deploy( deployer, baseUrl, repertory );
    });
    
});
