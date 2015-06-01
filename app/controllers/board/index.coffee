`import Ember from 'ember'`

BoardController = Ember.Controller.extend
  modalItem: {}

  actions:
    ### setups the modal with a new or existing item and opens it ###
    openModal: (typeOrItem)->
      if typeof typeOrItem == 'string'
        item = @store.createRecord 'item', type: typeOrItem
      else
        item = typeOrItem
      @set 'modalItem', item
      $('#item-modal').modal 'show'

    ### saves the item ###
    saveItem: ->
      @modalItem.set 'board', @model
      @modalItem.save().then => @set 'modalItem', {}
      $('#item-modal').modal 'hide'

`export default BoardController`
