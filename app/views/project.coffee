`import Ember from 'ember'`

ProjectView = Ember.View.extend
  didInsertElement: ->
    @modal = $('#new-project') unless @modal
    @modal.on
      'shown.bs.modal': =>
        @modal.find('input[type=text]').focus()
      'hide.bs.modal': =>
        @modal.removeClass 'has-error'

`export default ProjectView`
