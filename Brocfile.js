/* global require, module */
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

var app = new EmberApp({
  stylusOptions: {
    sourceMap: false //useless? how to use Stylus sourcemaps?
  }
});

// Use `app.import` to add additional libraries to the generated output files.
//
// If you need to use different assets in different environments, specify an
// object as the first parameter. That object's keys should be the environment
// name and the values should be the asset to use in that environment.
//
// If the library that you are including contains AMD or ES6 modules that you
// would like to import into your application please specify an object with the
// list of modules as keys along with the exports of each module as its value.

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

completeTree = merge([mainTree, progressHelper]);

var options = {
  autoprefixer: {
    browsers: ['> 1%', 'last 2 versions', 'Firefox ESR'], //default
    cascade: false
  },
  htmlmin: {
    conditionals: true
  },
  cssmin: {},
  jsmin: {},
  imgmin: {
    interlaced: true,
    optimizationLevel: 3,
    progressive: true,
    lossyPNG: false
  },
  gzip: { extensions: ['js', 'css'] }
};

//TODO: optimize trees with funnel so minification won't pass by unrelated files
//FIXME: remove useless images from build (img/outros)
finalTree =
  //gzip(
    htmlmin(
      jsmin(
        cssmin(
          imgmin(
            autoprefixer(completeTree, options.autoprefixer),
          options.imgmin),
        options.cssmin),
      options.jsmin),
    options.htmlmin);
  //options.gzip);

module.exports = finalTree;
