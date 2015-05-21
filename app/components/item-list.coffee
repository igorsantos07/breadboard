`import Ember from 'ember'`

ItemListComponent = Ember.Component.extend
  classNames: ['item-list', 'col-md-3', 'col-sm-3', 'col-xs-6']

  plural: Ember.computed 'type', ->
    @attrs.type + 's'

  actions:
    addItem: ->
      console.log arguments
      # now we should see how to get the 'new' item here so we can save it properly


`export default ItemListComponent`
