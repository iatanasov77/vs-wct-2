import { VsPath } from '../includes/fos_js_routes.js';

import * as sylius from '../deployers/sylius';
import * as magento from '../deployers/magento';
import * as prestashop from '../deployers/prestashop';

import * as vsConsole from '../includes/console';

var mapper;
var repertory;

function deploy( deployer, baseUrl, repertory, mapperFields )
{
    switch ( deployer ) {
        case 'sylius':
            sylius.deploy( baseUrl, repertory, mapperFields );
            break;
        case 'magento':
            magento.deploy( baseUrl, repertory, mapperFields );
            break;
        case 'prestashop':
            prestashop.deploy( baseUrl, repertory, mapperFields );
            break;
        default:
            alert( "Deployer '" + deployer + "' is Not Available !!!" );
    }
}

function getMapper( id )
{
    $.ajax({
        url: VsPath( 'vs_wct_project_mapper_json', { 'id': id } ),
        type: "GET",
        success: function ( response ) {
            //alert( "DEPLOYER IN CALLBACK: " + response.mapper.deployer );
            mapper  = response.mapper;
        },
        error: function () {
            alert( 'GET MAPPER ERROR !!!' );
        },
        
        // <- this turns it into synchronous
        // Execution is BLOCKED until request finishes.
        async: false
    });
}

function getRepertory( id )
{
    $.ajax({
        url: VsPath( 'vs_wct_project_json_repertory', { 'id': id } ),
        type: "GET",
        success: function ( response ) {
            //alert( response.status );
            repertory   = response.repertory;
        },
        error: function () {
            alert( 'GET REPERTORY ERROR !!!' );
        },
        
        // <- this turns it into synchronous
        // Execution is BLOCKED until request finishes.
        async: false
    });
}

$( function ()
{
    $( '.btnDisplayDeployer' ).on( 'click', function( e )
    {
        $( '#project_deployer_form_repertoryId' ).val( $( this ).attr( 'data-repertoryId' ) );
    });
    
    $( '#btnRunDeployer' ).on( 'click', function( e )
    {
        $( '#consoleDeployer' ).show();
        
        vsConsole.appendMessage( '#consoleDeployerBody', 'Starting Deployer ...' );
        vsConsole.appendMessage( '#consoleDeployerBody', 'Getting Mapper ...' );
        getMapper( $( '#project_deployer_form_mapper' ).val() );

        vsConsole.appendMessage( '#consoleDeployerBody', 'Getting Repertory ...' );
        getRepertory( $( '#project_deployer_form_repertoryId' ).val() );
    
        let baseUrl     = $( '#project_deployer_form_baseUrl' ).val();
        
        deploy( mapper.deployer, baseUrl, repertory, mapper.fields );
    });
    
});
