`import Ember from 'ember'`

ProjectRoute = Ember.Route.extend
  model: ->
    [
      {
        id: 123
        name: 'TheConf'
        boards: [
          { id: 1, name: 'Congressmen' }
          { id: 2, name: 'Organizers' }
          { id: 3, name: 'Store owners' }
        ]
      }, {
        id: 444
        name: 'My Project'
        boards: [
          { id: 4, name: 'Client 1' }
          { id: 5, name: 'Other client type' }
        ]
      }, {
        id: 666
        name: 'Empty project'
        boards: []
      }
    ]

  actions:
    new: ->
      console.log('here')

`export default ProjectRoute`
