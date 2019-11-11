var Encore = require( '@symfony/webpack-encore' );

Encore
    .setOutputPath( 'public/assets/build/old-template/' )
    .setPublicPath( '/assets/build/old-template' )
    .copyFiles({
         from: './assets/old-template/img',
         to: 'img/[path][name].[hash:8].[ext]',
     })
    
    .splitEntryChunks()
    .enableSingleRuntimeChunk()

    .cleanupOutputBeforeBuild()
    .enableBuildNotifications()
    .enableSourceMaps(!Encore.isProduction())
    // enables hashed filenames (e.g. app.abc123.css)
    .enableVersioning(Encore.isProduction())
    .autoProvidejQuery()

    .addLoader({
        test: /jsrouting-bundle\/Resources\/public\/js\/router.js$/,
        loader: "exports-loader?router=window.Routing"
    })
    .enableSassLoader(function(sassOptions) {}, {
        resolveUrlLoader: true
    })
    .configureFilenames({
        js: '[name].js?[contenthash]',
        css: '[name].css?[contenthash]',
        images: 'images/[name].[ext]?[hash:8]',
        fonts: 'fonts/[name].[ext]?[hash:8]'
    })
    
    .addEntry('app', './assets/old-template/js/app.js')
    .addEntry('main', './assets/old-template/js/main.js')
    
    .addEntry('jquery-duplicate-fields', './assets/old-template/vendor/jquery-duplicate-fields/jquery.duplicateFields.js')
    
    .addEntry('fieldsets', './assets/old-template/js/pages/fieldsets.js')
    .addEntry('fieldsets-edit', './assets/old-template/js/pages/fieldsets-edit.js')
    
    .addEntry('projects', './assets/old-template/js/pages/projects.js')
    .addEntry('projects-edit', './assets/old-template/js/pages/projects-edit.js')
    .addEntry('taxonomy-vocabolarities', './assets/old-template/js/pages/taxonomy-vocabolarities.js')

    .addStyleEntry( 'css/global', './assets/old-template/css/app.css')
    .addStyleEntry( 'css/browser', './assets/old-template/css/browser.css')
    .addStyleEntry( 'css/wct', './assets/old-template/css/wct.css')
;

const oldTemplate = Encore.getWebpackConfig();
oldTemplate.name = 'oldTemplate';

oldTemplate.watchOptions = {
    poll: true,
    ignored: /node_modules/
};

var path = require('path');
oldTemplate.resolve.alias	= {
    // Force all modules to use the same jquery version.
    'jquery': path.join(__dirname, 'node_modules/jquery/src/jquery'),
    'router': __dirname + '/assets/js/fos_js_routing.js'
};


//reset Encore to build the second config
Encore.reset();
Encore
    .setOutputPath( 'public/assets/build/new-template/' )
    .setPublicPath( '/assets/build/new-template' )
    
    .copyFiles({
         from: './assets/new-template/images',
         to: 'images/[path][name].[ext]',
     })
    
    .addEntry( 'app', './assets/new-template/js/app.js' )
    .addStyleEntry( 'css/global', './assets/new-template/css/main.css' )
    .addStyleEntry( 'css/browser', './assets/new-template/css/browser.css' )
    
    .autoProvidejQuery()
    .enableSassLoader(function(sassOptions) {}, {
        resolveUrlLoader: true
    })
    .configureFilenames({
        js: '[name].js?[contenthash]',
        css: '[name].css?[contenthash]',
        images: 'images/[name].[ext]?[hash:8]',
        fonts: 'fonts/[name].[ext]?[hash:8]'
    })
    .enableSingleRuntimeChunk()
    .enableVersioning(Encore.isProduction())
    .enableSourceMaps( !Encore.isProduction() )
    
    .addEntry('profile', './assets/new-template/js/pages/profile.js')
    
    .addEntry('jquery-duplicate-fields', './assets/new-template/js/jquery-duplicate-fields/jquery.duplicateFields.js')
    
    .addEntry('fieldsets', './assets/new-template/js/pages/fieldsets.js')
    .addEntry('fieldsets-edit', './assets/new-template/js/pages/fieldsets-edit.js')
    
    .addEntry('projects', './assets/new-template/js/pages/projects.js')
    .addEntry('projects-edit', './assets/new-template/js/pages/projects-edit.js')
    
    .addEntry('taxonomy-vocabolarities', './assets/new-template/js/pages/taxonomy-vocabolarities.js')
    
    .addEntry('gateway-config', './assets/new-template/js/pages/gateway-config.js')
;

// build the second configuration
const newTemplate = Encore.getWebpackConfig();
newTemplate.name = 'newTemplate';


// export the final configuration as an array of multiple configurations
module.exports = [oldTemplate, newTemplate];
