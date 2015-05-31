/* global require, module */
var ENV = process.env.BROCCOLI_ENV || 'development';
var isPROD = (ENV == 'production');

var autoprefixer = require('broccoli-autoprefixer');
var htmlmin = require('broccoli-htmlmin');
var cssmin  = require('broccoli-clean-css');
var jsmin   = require('broccoli-uglify-js');
var imgmin  = require('broccoli-imagemin');
//apparently GZIP doesn't work out of the box; resources fail to be interpreted
//var gzip    = require('broccoli-gzip');

var funnel   = require('broccoli-funnel');
var merge    = require('broccoli-merge-trees');
var EmberApp = require('ember-cli/lib/broccoli/ember-app');


var options = {
  stylus: {},
  autoprefixer: {
    browsers: ['> 1%', 'last 2 versions', 'Firefox ESR'], //default
    cascade: true
  },
  htmlmin: {
    conditionals: true
  },
  cssmin: {
    keepSpecialComments: (ENV == 'development')? '*' : '0'
  },
  jsmin: {},
  imgmin: {
    interlaced: true,
    optimizationLevel: 3,
    progressive: true,
    lossyPNG: false
  },
  gzip: { extensions: ['js', 'css'] }
};


var app = new EmberApp({ stylusOptions: options.stylus });

// If you need to use different assets in different environments, specify an
// object as the first parameter. That object's keys should be the environment
// name and the values should be the asset to use in that environment.
app.import('bower_components/bootstrap/dist/js/bootstrap.min.js');
app.import('bower_components/bootswatch/sandstone/bootstrap.min.css');
app.import('bower_components/bootswatch/fonts/glyphicons-halflings-regular.woff2', {destDir: 'fonts'});
app.import('bower_components/bootswatch/fonts/glyphicons-halflings-regular.woff', {destDir: 'fonts'});
app.import('bower_components/bootswatch/fonts/glyphicons-halflings-regular.ttf', {destDir: 'fonts'});
app.import('bower_components/lodash/lodash.min.js');
var mainTree = app.toTree();

// Adding progress bar files separately to the tree
var progressHelper = merge([
  funnel('bower_components/pace', { files: ['pace.js'], destDir: 'assets/pace' }),
  funnel('app/styles', { files: ['pace.css'], destDir: 'assets/pace' })
]);

finalTree = merge([mainTree, progressHelper]);

//TODO: optimize trees with funnel so minification won't pass by unrelated files
//FIXME: remove useless images from build (img/outros)
finalTree = autoprefixer(finalTree, options.autoprefixer);
if (isPROD) {
  //no need to compress images in development
  finalTree = imgmin(finalTree, options.imgmin);
  //unable to compress and leave sourcemap comment: github.com/jakubpawlowicz/clean-css/issues/589
  finalTree = cssmin(finalTree, options.cssmin);
  //misteriously, output.comments=true will still stripe out sourcemap comment in the end
  //FIXME: there's no support for CoffeeScript sourcemaps yet: github.com/kimroen/ember-cli-coffeescript/issues/7
  finalTree = jsmin(finalTree, options.jsmin);
}
finalTree = htmlmin(finalTree, options.htmlmin);
//won't work without headers, I guess
//finalTree = gzip(finalTree, options.gzip);

module.exports = finalTree;
