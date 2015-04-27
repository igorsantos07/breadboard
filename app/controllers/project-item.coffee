`import Ember from 'ember'`

ProjectItemController = Ember.Controller.extend
  isAddingBoard: false
  newBoardName: ''

  form: (project)->
    $("#project-#{project.id} .form")

  actions:
    new: (project)->
      @toggleProperty 'isAddingBoard'
      @form(project).find('input[name=new-board]').focus() if @isAddingBoard

    create: (project)->
      form = @form project
      name = @get('newBoardName').trim()
      form.toggleClass 'has-error', !name
      return false unless name
      board = @store.createRecord 'board', name: @newBoardName, project: project
      board.save().then ->
        project.save()
      @set 'isAddingBoard', false
      @set 'newBoardName', ''


`export default ProjectItemController`
