`import Ember from 'ember'`

ProjectView = Ember.View.extend
  didInsertElement: ->
    @modal = $('#new-project') unless @modal
    @modal.on
      'shown.bs.modal': =>
        @modal.find('input[type=text]').focus()
      'hide.bs.modal': =>
        @modal.removeClass 'has-error'

      $('input[name=project-name]').on 'keyup', (e)->
        if (e.keyCode == 27) #ESC
          $(this).parents('.project-panel').removeClass('editing')

`export default ProjectView`
