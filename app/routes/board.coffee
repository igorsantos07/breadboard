`import Ember from 'ember'`
`import BasicRoute from './-route'`

BoardRoute = BasicRoute.extend
  project_name: ''

  meta: ->
    original = @_super()
    model = @currentModel
    property:
      _.extend original.property,
        'og:type': 'article'
        'og:title': "#{model.get('name')} Experiment Board from #{@get('project_name')} on ProtoBoard.com"
        'og:article:published_time': model.get('createdAt').toISOString()
        'og:article:modified_time': model.get('updatedAt').toISOString()
#        'og:article:author': model.get('owner.name')

  model: (params)->
    @set 'project_name', params.project_name
    id = params.board_name_id.split('-')[1]
    @store.findById 'board', id

  setupController: (controller, model)->
    @_super controller, model
    model.get('project').then (proj)=>
      app = @controllerFor('application')
      app.set 'project_name', proj.get('name')
      app.set 'board_name', model.get('name')

`export default BoardRoute`
