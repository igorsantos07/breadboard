`import Ember from 'ember'`

BoardRoute = Ember.Route.extend
  model: (params)->
    id = params.board_name_id.split('-')[1]
    @store.findById 'board', id

  setupController: (controller, model)->
    @_super controller, model
    model.get('project').then (proj)=>
      app = @controllerFor('application')
      app.set 'project_name', proj.get('name')
      app.set 'board_name', model.get('name')

`export default BoardRoute`
