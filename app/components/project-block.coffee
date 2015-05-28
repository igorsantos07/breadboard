`import Ember from 'ember'`

ProjectBlockComponent = Ember.Component.extend
  isAddingBoard: false
  newBoardName: ''

  form: ->
    @_form = $(@element).find('.form') unless @_form
    return @_form

  actions:
    edit: ->
      $element = $(@element)
      $element.toggleClass 'editing'
      if $element.hasClass 'editing'
        $element.find('input[name=project-name]').focus().select()

    save: ->
      $element = $(@element)
      $element.removeClass 'editing'
      @attrs.project.save()

    remove: ->
      @attrs.project.destroyRecord() if (window.confirm 'Are you sure you want to ' +
        " delete the project \"#{@attrs.project.get('name')}\" and all its boards?")

    newBoard: ->
      @toggleProperty 'isAddingBoard'
      @form()
        .toggleClass 'hidden'
        .find('input[name=new-board]').focus() if @isAddingBoard

    createBoard: ->
      name = @get('newBoardName').trim()

      @form().toggleClass 'has-error', !name
      return false unless name

      #FIXME: PLEASE REFACTOR ME!!!! We should not access the store this way;
      #       Instead, we should use sendAction to bubble into the controller
      board = @get('targetObject').store.createRecord 'board',
        name: @newBoardName,
        project: @attrs.project

      board.save().then => @attrs.project.save()

      @set 'isAddingBoard', false
      @set 'newBoardName', ''
      @form().addClass 'hidden'

  #FIXME: being called for each block instance! should be called once per page!
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


`export default ProjectBlockComponent`
