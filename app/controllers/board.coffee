`import Ember from 'ember'`

BoardController = Ember.Controller.extend
  actions:
    addItem: ->
      console.log 'estou no controller'

`export default BoardController`
