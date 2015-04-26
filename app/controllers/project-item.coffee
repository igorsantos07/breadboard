`import Ember from 'ember'`

ProjectItemController = Ember.Controller.extend
  isAddingBoard: false
  newBoardName: ''

  actions:
    toggleNewBoard: ->
      @set 'isAddingBoard', !@get 'isAddingBoard'

`export default ProjectItemController`
