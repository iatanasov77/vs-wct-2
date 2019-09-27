var Encore = require('@symfony/webpack-encore');

Encore
    // directory where compiled assets will be stored
    .setOutputPath('public/build/')
    // public path used by the web server to access the output path
    .setPublicPath('/build')
    // only needed for CDN's or sub-directory deploy
    //.setManifestKeyPrefix('build/')
    
    .copyFiles({
         from: './assets/img',

         // optional target path, relative to the output dir
         //to: 'images/[path][name].[ext]',

         // if versioning is enabled, add the file hash too
         to: 'img/[path][name].[hash:8].[ext]',

         // only copy files matching this pattern
         //pattern: /\.(png|jpg|jpeg)$/
     })
    
    
    // When enabled, Webpack "splits" your files into smaller pieces for greater optimization.
    .splitEntryChunks()

    // will require an extra script tag for runtime.js
    // but, you probably want this, unless you're building a single-page app
    .enableSingleRuntimeChunk()

    /*
     * FEATURE CONFIG
     *
     * Enable & configure other features below. For a full
     * list of features, see:
     * https://symfony.com/doc/current/frontend.html#adding-more-features
     */
    .cleanupOutputBeforeBuild()
    .enableBuildNotifications()
    .enableSourceMaps(!Encore.isProduction())
    // enables hashed filenames (e.g. app.abc123.css)
    .enableVersioning(Encore.isProduction())

    // enables @babel/preset-env polyfills
//    .configureBabel(() => {}, {
//        useBuiltIns: 'usage',
//        corejs: 3
//    })

    // uncomment if you're having problems with a jQuery plugin
    .autoProvidejQuery()
    
    .addLoader({
        test: /jsrouting-bundle\/Resources\/public\/js\/router.js$/,
        loader: "exports-loader?router=window.Routing"
    })
    
    // see https://symfony.com/doc/current/frontend/encore/bootstrap.html
    .enableSassLoader(function(sassOptions) {}, {
        resolveUrlLoader: true
    })

    // add hash after file name
    .configureFilenames({
        js: '[name].js?[contenthash]',
        css: '[name].css?[contenthash]',
        images: 'images/[name].[ext]?[hash:8]',
        fonts: 'fonts/[name].[ext]?[hash:8]'
    })

    // uncomment if you use TypeScript
    //.enableTypeScriptLoader()

    // uncomment to get integrity="..." attributes on your script & link tags
    // requires WebpackEncoreBundle 1.4 or higher
    //.enableIntegrityHashes()

    // uncomment if you use API Platform Admin (composer req api-admin)
    //.enableReactPreset()
    //.addEntry('admin', './assets/js/admin.js')
    
    /*
     * ENTRY CONFIG
     *
     * Add 1 entry for each "page" of your app
     * (including one that's included on every page - e.g. "app")
     *
     * Each entry will result in one JavaScript file (e.g. app.js)
     * and one CSS file (e.g. app.css) if you JavaScript imports CSS.
     */
    .addEntry('app', './assets/js/app.js')
    .addEntry('main', './assets/js/main.js')
    .addEntry('jquery-duplicate-fields', './assets/vendor/jquery-duplicate-fields/jquery.duplicateFields.js')
    .addEntry('fieldsets', './assets/js/pages/fieldsets.js')
    .addEntry('projects', './assets/js/pages/projects.js')
    .addEntry('projects-edit', './assets/js/pages/projects-edit.js')
    .addEntry('taxonomy-vocabolarities', './assets/js/pages/taxonomy-vocabolarities.js')

    .addStyleEntry( 'css/global', './assets/css/app.css')
    .addStyleEntry( 'css/browser', './assets/css/browser.css')
;

const config = Encore.getWebpackConfig();

config.watchOptions = {
    poll: true,
    ignored: /node_modules/
};

var path = require('path');
config.resolve.alias	= {
    // Force all modules to use the same jquery version.
    'jquery': path.join(__dirname, 'node_modules/jquery/src/jquery'),
    'router': __dirname + '/assets/js/fos_js_routing.js'
};
//var CopyWebpackPlugin = require('copy-webpack-plugin');
//config.plugins.push(
//    new CopyWebpackPlugin([
//    	{ from: 'node_modules/gijgo/fonts', to: 'fonts' } 
//    ]) 
//);

module.exports = config;

