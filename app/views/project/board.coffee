`import Ember from 'ember'`

ProjectBoardView = Ember.View.extend
  templateName: 'project/board'

  actions:
    #TODO: implement board name editing
    edit: -> alert('Not yet implemented. Sorry!')

    remove: ->
      if (window.confirm "Are you sure you want to delete the board \"#{@content.get('name')}\"?")
        @content.get('project').then (project)=>
          console.log @content.deleteRecord()
          @content.save().then ->
            project.save()


`export default ProjectBoardView`
