`import Ember from 'ember'`

ProjectController = Ember.Controller.extend
  newProjectName: ''

  actions:
    createProject: ->
      @modal = $('#new-project') unless @modal
      name   = @get('newProjectName').trim()
      if name
        @modal.removeClass 'has-error'
      else
        @modal.addClass 'has-error'
        return false
      @store.createRecord('project', name: name).save()
      @modal.modal 'hide'
      @set 'newProjectName', ''

`export default ProjectController`
