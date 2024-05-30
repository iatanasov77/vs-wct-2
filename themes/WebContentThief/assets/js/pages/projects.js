//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// bin/web-content-thief fos:js-routing:dump --format=json --target=public/shared_assets/js/fos_js_routes_application.json
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
var routes  = require( '../../../../../public/shared_assets/js/fos_js_routes_application.json' );
import { VsPath } from '@/js/includes/fos_js_routes.js';

require( '@/js/includes/resource-delete.js' );

$( function ()
{
    $( "#form_filterByCategory" ).on( 'change', function() {
        let filterCategory  = $( this ).val();
        let url             = VsPath( 'vs_wct_projects_index', {}, routes );
        if ( filterCategory ) {
            url += filterCategory + '/';
        }
        
        document.location   = url;
    });
    
});
