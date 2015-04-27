`import Ember from 'ember'`

ProjectView = Ember.View.extend
  templateName: 'project/index'

  isAddingBoard: false
  newBoardName: ''

  form: ->
    @_form = $("#project-#{@content.id} .form") unless @_form
    return @_form

  actions:
    edit: ->
      $block = $("#project-#{@content.id}")
      $block.toggleClass 'editing'
      if $block.hasClass 'editing'
        $block.find('input[type=text]').focus().select()

    save: ->
      $block = $("#project-#{@content.id}")
      $block.removeClass 'editing'
      @content.save()

    remove: ->
      @content.destroyRecord() if (window.confirm 'Are you sure you want to ' +
        " delete the project \"#{@content.get('name')}\" and all its boards?")

    newBoard: ->
      form = @form @content

      @toggleProperty 'isAddingBoard'
      form.toggleClass 'hidden'
      form.find('input[name=new-board]').focus() if @isAddingBoard

    createBoard: ->
      form = @form @content
      name = @get('newBoardName').trim()

      form.toggleClass 'has-error', !name
      return false unless name

      board = @get('controller').store.createRecord 'board',
        name: @newBoardName,
        project: @content

      board.save().then => @content.save()

      @set 'isAddingBoard', false
      @set 'newBoardName', ''
      form.addClass 'hidden'

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
