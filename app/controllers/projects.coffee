`import Ember from 'ember'`

ProjectsController = Ember.Controller.extend
  newProjectName: ''

  actions:
    create: ->
      @modal = $('#new-project') unless @modal
      name   = @get('newProjectName').trim()

      @modal.toggleClass 'has-error', !name
      return false unless name

      project = @store.createRecord('project', name: name)
      project.save()

      # we didn't need this before using views to render each project. weird.
      @model.addRecord(project, 0)

      @modal.modal 'hide'
      @set 'newProjectName', ''

`export default ProjectsController`
