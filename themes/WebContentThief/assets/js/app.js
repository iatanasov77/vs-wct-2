/*
 * Welcome to your app's main JavaScript file!
 *
 * We recommend including the built version of this JavaScript file
 * (and its CSS file) in your base layout (base.html.twig).
 */
const $ = require( 'jquery' );
global.$ = $;
window.$ = $;

// bootstrap should be before jquery-ui
require( 'bootstrap' );

require( '../vendor/slimscroll/jquery.slimscroll.js' );

require( './main.js' );

