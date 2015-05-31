`import Ember from 'ember'`

BoardController = Ember.Controller.extend
  modalItem: {}

  actions:
    ### setups the modal and opens it ###
    addItem: (type)->
      @set 'modalItem', @store.createRecord 'item', type: type
      $('#item-modal').modal 'show'

    ### saves the item ###
    createItem: ->
      @modalItem.set 'board', @model
      @modalItem.save().then => @set 'modalItem', {}
      $('#item-modal').modal 'hide'

`export default BoardController`
