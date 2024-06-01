const Encore = require('@symfony/webpack-encore');
const path = require('path');

Encore
    .setOutputPath( 'public/shared_assets/build/web-content-thief/' )
    .setPublicPath( '/build/web-content-thief/' )
  
    .disableSingleRuntimeChunk()
    .cleanupOutputBeforeBuild()
    .enableSourceMaps(!Encore.isProduction())
    .enableVersioning(Encore.isProduction())
    
    .enableSassLoader(function(sassOptions) {}, {
        resolveUrlLoader: true
    })
    
    .addAliases({
        '@': path.resolve( __dirname, '../../vendor/vankosoft/application/src/Vankosoft/ApplicationBundle/Resources/themes/default/assets' ),
        '@@': path.resolve( __dirname, '../../vendor/vankosoft/payment-bundle/lib/Resources/assets' )
    })
    
    .autoProvidejQuery()
    .configureFilenames({
        js: '[name].js?[contenthash]',
        css: '[name].css?[contenthash]',
        assets: '[name].[ext]?[hash:8]'
    })
    
    .copyFiles({
         from: './themes/WebContentThief/assets/images',
         to: 'images/[path][name].[ext]',
     })

    .addStyleEntry( 'css/app', './themes/WebContentThief/assets/css/main.scss' )
    .addStyleEntry( 'css/browser', './themes/WebContentThief/assets/css/browser.css' )
    .addEntry( 'js/app', './themes/WebContentThief/assets/js/app.js' )
    
    .addEntry( 'js/filemanager-file-upload', './themes/WebContentThief/assets/js/pages/filemanager-file-upload.js' )
    .addEntry( 'js/profile', './themes/WebContentThief/assets/js/pages/profile.js' )
    
    .addEntry( 'js/browser', './themes/WebContentThief/assets/js/pages/browser.js' )
    .addEntry( 'js/collector', './themes/WebContentThief/assets/js/pages/collector.js' )
    .addEntry( 'js/deployer', './themes/WebContentThief/assets/js/pages/deployer.js' )
    .addEntry( 'js/mapper', './themes/WebContentThief/assets/js/pages/mapper.js' )
    
    .addEntry( 'js/projects', './themes/WebContentThief/assets/js/pages/projects.js' )
    .addEntry( 'js/projects-edit', './themes/WebContentThief/assets/js/pages/projects-edit.js' )
    .addEntry( 'js/projects-categories', './themes/WebContentThief/assets/js/pages/projects-categories.js' )
    .addEntry( 'js/api-hosts', './themes/WebContentThief/assets/js/pages/api-hosts.js' )
    .addEntry( 'js/repertory-preview', './themes/WebContentThief/assets/js/pages/repertory-preview.js' )
;

Encore.configureDefinePlugin( ( options ) => {
    options.IS_PRODUCTION = JSON.stringify( Encore.isProduction() );
});

const config = Encore.getWebpackConfig();
config.name = 'WebContentThief';

module.exports = config;
