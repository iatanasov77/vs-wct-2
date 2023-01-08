var Encore = require( '@symfony/webpack-encore' );

/**
 *  AdminPanel Default Theme
 */
const themePath         = './vendor/vankosoft/application/src/Vankosoft/ApplicationBundle/Resources/themes/default';
const adminPanelConfig  = require( themePath + '/webpack.config' );

//=================================================================================================

/**
 *  WebContentThief Theme
 */
Encore.reset();
const WebContentThiefConfig   = require('./themes/WebContentThief/webpack.config');

//=================================================================================================


module.exports = [
    adminPanelConfig,
    WebContentThiefConfig
];
