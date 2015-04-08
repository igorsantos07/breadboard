`import Ember from 'ember'`
`import config from './config/environment'`

Router = Ember.Router.extend
  location: config.locationType

routing = Router.map ->
  @route 'item', ->
    @route 'new'
    @route 'edit'
    @route 'delete'

`export default routing`
