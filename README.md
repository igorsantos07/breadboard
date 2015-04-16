# ProtoBoard

Webapp version of Javelin's Experiment Board.

## Prerequisites

You will need the following things properly installed on your computer.

* [Git](http://git-scm.com)
* [io.js](http://nodejs.org) (with NPM)
* [Bower](http://bower.io)
* [Ember CLI](http://www.ember-cli.com)
* [PhantomJS](http://phantomjs.org)
* [CoffeeScript](http://www.coffeescript.org)

You can get all those (except Git, duh) by following the NVM install
instructions and then running `nvm install iojs`. The application was
made with io.js 1.6.4, if this information is useful for you. Then, you
run `npm -g install ember-cli; npm install -g bower; npm install -g
phantomjs; npm install -g coffee-script`.

## Installation

* `git clone <repository-url>` this repository
* change into the new directory
* `npm install`
* `bower install`

## Running / Development

* `ember server`
* Visit your app at [http://localhost:4200](http://localhost:4200).

## Running / Production

* Run `config/post-receive.githook.sh` from inside the repository
  (this should be installed as a Git Hook, actually)
* Enjoy it from the `dist/` folder in your favourite web server

### Code Generators

Make use of the many generators for code, try `ember help generate` for more details

### Running Tests

* `ember test`
* `ember test --server`

## Further Reading / Useful Links

* [ember.js](http://emberjs.com)
* [ember-cli](http://www.ember-cli.com)
* [CoffeeScript](http://www.coffeescript.org)
* [Bootswatch Sandstone theme](https://bootswatch.com/sandstone)
* Development Browser Extensions
  * [ember inspector for chrome](https://chrome.google.com/webstore/detail/ember-inspector/bmdblncegkenkacieihfhpjfppoconhi)
  * [ember inspector for firefox](https://addons.mozilla.org/en-US/firefox/addon/ember-inspector/)
