`import Ember from 'ember'`

ItemListComponent = Ember.Component.extend
  classNames: ['item-list', 'col-md-3', 'col-sm-3', 'col-xs-6']

  plural: Ember.computed 'type', ->
    @attrs.type + 's'

  modal: Ember.computed 'type', ->
    $("#add-#{@attrs.type}")

  actions:
    #FIXME: refactor. this should be handled by the controller, not the component
    addItem: ->
      @getAttr('new').set 'board', @getAttr('board')
      @getAttr('new').save().then =>
        @setAttr 'new', @get('targetObject.store').createRecord 'item', type: @getAttr('new').get('type')
      @get('modal').modal 'hide'
      @get('modal').find('input, textarea').val('')

  didInsertElement: ->
    @get('modal').on 'shown.bs.modal', =>
      @get('modal').find('input[type=text]:first').focus()


`export default ItemListComponent`
