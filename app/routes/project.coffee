`import Ember from 'ember'`

ProjectRoute = Ember.Route.extend
  model: ->
    @store.findAll 'project'

`export default ProjectRoute`
