`import Ember from 'ember'`

BoardLineComponent = Ember.Component.extend
  actions:
    #TODO: implement board name editing
    edit: -> alert('Not yet implemented. Sorry!')

    remove: ->
      if (window.confirm "Are you sure you want to delete the board \"#{@attrs.board.get('name')}\"?")
        @attrs.board.get('project').then (project)=>
          @attrs.board.destroyRecord()
          project.save()

`export default BoardLineComponent`
