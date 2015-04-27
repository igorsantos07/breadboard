`import Ember from 'ember'`

ProjectRoute = Ember.Route.extend
  model: ->
    @store.find 'project', order: '-updatedAt'

`export default ProjectRoute`
