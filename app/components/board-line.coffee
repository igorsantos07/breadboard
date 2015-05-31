`import Ember from 'ember'`

BoardLineComponent = Ember.Component.extend
  actions:
    #TODO: implement board name editing
    edit: -> alert('Not yet implemented. Sorry!')

    remove: ->
      if confirm "Are you sure you want to delete the board \"#{@getAttr('board').get('name')}\"?"
        @attrs.board.destroyRecord()

`export default BoardLineComponent`
