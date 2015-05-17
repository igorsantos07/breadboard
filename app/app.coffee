`import Ember from 'ember'`
`import Resolver from 'ember/resolver'`
`import loadInitializers from 'ember/load-initializers'`

`import config from './config/environment'`

Ember.MODEL_FACTORY_INJECTIONS = true

#overwriting Ember deprecation warnings so we can filter them out easily in the console
Ember.deprecate = (->
  already_shown = []
  (msg, test, opt)->
    return false if test
    if already_shown.indexOf(msg) == -1
      warning = "DEPRECATION: #{msg}"
      warning += " See: #{opt.url}" if opt.url
      console.debug warning
    already_shown.push msg
)()

App = Ember.Application.extend
  modulePrefix:    config.modulePrefix
  podModulePrefix: config.podModulePrefix
  Resolver:        Resolver

loadInitializers App, config.modulePrefix

`export default App`
