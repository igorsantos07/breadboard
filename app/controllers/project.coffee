`import Ember from 'ember'`

ProjectController = Ember.Controller.extend
  newProjectName: ''

  actions:
    create: ->
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

    edit: (project)->
      $block = $("#project-#{project.id}")
      $block.toggleClass('editing')
      if $block.hasClass('editing')
        $block.find('input[type=text]').focus().select()

    save: (project)->
      $block = $("#project-#{project.id}")
      $block.removeClass('editing')
      project.save()

    remove: (project)->
      if (window.confirm("Are you sure you want to delete the project \"#{project.get('name')}\" and all its boards?"))
        project.destroyRecord()

`export default ProjectController`
