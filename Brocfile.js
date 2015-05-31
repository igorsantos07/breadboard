/* global require, module */

var funnel   = require('broccoli-funnel');
var merge    = require('broccoli-merge-trees');
var EmberApp = require('ember-cli/lib/broccoli/ember-app');
var autoprefixer = require('broccoli-autoprefixer');

var app = new EmberApp();

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

tree = autoprefixer(completeTree, {
  browsers: ['> 1%', 'last 2 versions', 'Firefox ESR'], //default
  cascade: false
});

module.exports = tree;
