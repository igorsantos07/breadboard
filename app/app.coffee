`import Ember from 'ember'`
`import Resolver from 'ember/resolver'`
`import loadInitializers from 'ember/load-initializers'`
`import config from './config/environment'`
`//import ParseAdapter from 'ember-parse-adapter/addon/adapters/application'`

Ember.MODEL_FACTORY_INJECTIONS = true

App = Ember.Application.extend
  modulePrefix: config.modulePrefix
  podModulePrefix: config.podModulePrefix
  Resolver: Resolver
#  ApplicationAdapter: ParseAdapter.extend
#    applicationId: config.APP.applicationId
#    restApiId: config.APP.restApiId
#    javascriptId: config.APP.javascriptId

loadInitializers App, config.modulePrefix

`export default App`
