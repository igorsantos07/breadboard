`import Ember from 'ember'`

ProjectsRoute = Ember.Route.extend
  model: ->
    @store.find 'project', order: '-updatedAt'

`export default ProjectsRoute`
