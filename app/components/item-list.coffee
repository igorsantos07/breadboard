`import Ember from 'ember'`

ItemListComponent = Ember.Component.extend
  classNames: ['item-list', 'col-md-3', 'col-sm-3', 'col-xs-6']

  plural: Ember.computed 'type', ->
    @attrs.type + 's'

  actions:
    addItem: ->
      console.log arguments

`export default ItemListComponent`
