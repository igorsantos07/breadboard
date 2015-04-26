`import Ember from 'ember'`

ProjectView = Ember.View.extend
  didInsertElement: ->
    @modal = $('#new-project') unless @modal
    @modal.on 'hide.bs.modal', =>
      @modal.removeClass 'has-error'

`export default ProjectView`
