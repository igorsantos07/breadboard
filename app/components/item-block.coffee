`import Ember from 'ember'`

itemComponent = Ember.Component.extend
  classNames: ['thumbnail']
  actions:
    toggleDetails: ->
      @toggleProperty 'showDetails'

`export default itemComponent`
