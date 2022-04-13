const Encore = require('@symfony/webpack-encore');

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
    
    /**
     * Add Entries
     */
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
    
    .addEntry( 'js/projects-edit', './themes/WebContentThief/assets/js/pages/projects-edit.js' )
;

const config = Encore.getWebpackConfig();
config.name = 'WebContentThief';

module.exports = config;
