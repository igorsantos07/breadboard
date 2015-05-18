`import Ember from 'ember'`

BoardController = Ember.Controller.extend
  itemTypes: ['customer', 'problem', 'risk', 'solution'] #TODO should move this to a static property of Item model?

  new: Ember.computed ->
    objects = {}
    @itemTypes.forEach (type)=>
      objects[type] = @store.createRecord 'item', type: type
    return objects

`export default BoardController`
