`import Ember from 'ember'`

ProjectItemController = Ember.Controller.extend
  isAddingBoard: false
  newBoardName: ''

  actions:
    toggleNewBoard: (project)->
      @set 'isAddingBoard', !@get 'isAddingBoard'
      if @get 'isAddingBoard'
        #not using simple template conditional as it breaks field focus
        board_form = $("#project-#{project.id} form")
        board_form.removeClass('hidden')
        board_form.find('input[name=new-board]').focus()


`export default ProjectItemController`
