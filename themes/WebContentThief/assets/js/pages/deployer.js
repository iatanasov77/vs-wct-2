import { VsPath } from '../includes/fos_js_routes.js';

import * as sylius from '../deployers/sylius';
import * as magento from '../deployers/magento';
import * as prestashop from '../deployers/prestashop';

import * as vsConsole from '../includes/console';

var apiHost;
var deployer;
var productsRequests;

function validateForm()
{
    let repertoryId = parseInt( $( '#project_deployer_form_repertoryId' ).val() );
    let apiHostId   = parseInt( $( '#project_deployer_form_apiHost' ).val() );
    let mapperId    = parseInt( $( '#project_deployer_form_mapper' ).val() );
    
    if ( repertoryId && apiHostId && mapperId ) {
        return {
            'repertoryId': repertoryId,
            'apiHostId': apiHostId,
            'mapperId': mapperId
        };
    }
    
    return false;
}

function getApiHost( id )
{
    $.ajax({
        url: VsPath( 'vs_wct_api_host_json', { 'id': id } ),
        type: "GET",
        success: function ( response ) {
            apiHost  = response.apiHost;
        },
        error: function () {
            alert( 'GET API HOST ERROR !!!' );
        },
        
        // <- this turns it into synchronous
        // Execution is BLOCKED until request finishes.
        async: false
    });
}

function getDeployer( mapperId )
{
    $.ajax({
        url: VsPath( 'vs_wct_project_mapper_deployer_json', { 'mapperId': mapperId } ),
        type: "GET",
        success: function ( response ) {
            //alert( response.status );
            deployer   = response.deployer;
        },
        error: function () {
            alert( 'GET DEPLOYER ERROR !!!' );
        },
        
        // <- this turns it into synchronous
        // Execution is BLOCKED until request finishes.
        async: false
    });
}

function getProductsRequests( repertoryId, mapperId )
{
    $.ajax({
        url: VsPath( 'vs_wct_service_sylius_get_create_product_request_body', { 'repertoryId': repertoryId, 'mapperId': mapperId } ),
        type: "GET",
        success: function ( response ) {
            //alert( response.status );
            productsRequests   = response.requestBody;
        },
        error: function () {
            alert( 'GET PRODUCTS REQUESTS ERROR !!!' );
        },
        
        // <- this turns it into synchronous
        // Execution is BLOCKED until request finishes.
        async: false
    });
}

function deployItems( deployer, apiHost, productsRequests )
{
    switch ( deployer ) {
        case 'sylius':
            sylius.deployProducts( apiHost, productsRequests );
            break;
        case 'magento':
            magento.deployProducts( apiHost, productsRequests );
            break;
        case 'prestashop':
            prestashop.deployProducts( apiHost, productsRequests );
            break;
        default:
            alert( "Deployer '" + deployer + "' is Not Available !!!" );
    }
}

function downloadItems( deployer, apiHost, productsRequests )
{
    switch ( deployer ) {
        case 'sylius':
            //sylius.deleteProducts( apiHost, productsRequests );
            break;
        case 'magento':
            //magento.deleteProducts( apiHost, productsRequests );
            break;
        case 'prestashop':
            //prestashop.deleteProducts( apiHost, productsRequests );
            break;
        default:
            alert( "Deployer '" + deployer + "' is Not Available !!!" );
    }
}

function deleteItems( deployer, apiHost, productsRequests )
{
    switch ( deployer ) {
        case 'sylius':
            sylius.deleteProducts( apiHost, productsRequests );
            break;
        case 'magento':
            magento.deleteProducts( apiHost, productsRequests );
            break;
        case 'prestashop':
            prestashop.deleteProducts( apiHost, productsRequests );
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
        let params  = validateForm();
        if ( ! params ) {
            alert( 'Please Select Api Host and Mapper' );
            return;
        }
        
        $( '#consoleDeployer' ).show();
        
        vsConsole.appendMessage( '#consoleDeployerBody', 'Starting Deployer ...' );
        
        vsConsole.appendMessage( '#consoleDeployerBody', 'Getting Api Host Parameters ...' );
        getApiHost( params.apiHostId );

        vsConsole.appendMessage( '#consoleDeployerBody', 'Getting Mapper Deployer ID ...' );
        getDeployer( params.mapperId );
        
        vsConsole.appendMessage( '#consoleDeployerBody', 'Getting Products Requests ...' );
        getProductsRequests( params.repertoryId, params.mapperId );
    
        deployItems( deployer, apiHost, productsRequests );
    });
    
    $( '#btnRunDeleter' ).on( 'click', function( e )
    {
        let params  = validateForm();
        if ( ! params ) {
            alert( 'Please Select Api Host and Mapper' );
            return;
        }
        
        $( '#consoleDeployer' ).show();
        
        vsConsole.appendMessage( '#consoleDeployerBody', 'Starting Delete Items ...' );
        
        vsConsole.appendMessage( '#consoleDeployerBody', 'Getting Api Host Parameters ...' );
        getApiHost( params.apiHostId );

        vsConsole.appendMessage( '#consoleDeployerBody', 'Getting Mapper Deployer ID ...' );
        getDeployer( params.mapperId );
        
        vsConsole.appendMessage( '#consoleDeployerBody', 'Getting Products Requests ...' );
        getProductsRequests( params.repertoryId, params.mapperId );

        deleteItems( deployer, apiHost, productsRequests );
    });
    
    $( '#btnRunDownloader' ).on( 'click', function( e )
    {
        let params  = validateForm();
        if ( ! params ) {
            alert( 'Please Select Api Host and Mapper' );
            return;
        }
        
        $( '#consoleDeployer' ).show();
        
        vsConsole.appendMessage( '#consoleDeployerBody', 'Starting Download Items ...' );
        
        downloadItems( deployer, apiHost, productsRequests );
    });
});
