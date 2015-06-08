`import Ember from 'ember'`

hypothesisComponent = Ember.Component.extend
  classNames: ['panel', 'panel-default']

  actions:
    remove: ->
      if confirm "Are you sure you want to delete that hypothesis?"
        @getAttr('hypothesis').destroyRecord()

`export default hypothesisComponent`
