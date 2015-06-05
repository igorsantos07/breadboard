`import Ember from 'ember'`
`import BasicRoute from './-route'`

ProjectsRoute = BasicRoute.extend
  model: ->
    @store.find 'project', order: '-updatedAt'

`export default ProjectsRoute`
