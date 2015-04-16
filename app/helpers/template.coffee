`import Ember from 'ember'`

_.templateSettings.interpolate = /{{([\s\S]+?)}}/g

func = (template, options)->
  _.template(template)(options.hash)

`export default Ember.Handlebars.registerBoundHelper('template', func)`
