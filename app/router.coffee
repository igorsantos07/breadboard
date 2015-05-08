`import Ember from 'ember'`
`import config from './config/environment'`

Router = Ember.Router.extend
  location: config.locationType

routing = Router.map ->
  @route 'account', ->
    @route 'sign-up'
    @route 'login'
    @route 'details'
    @route 'edit'
    @route 'billing'
    @route 'plans'
  @route 'projects'
  @route 'board', path: '/:project_name/:board_name_id', ->
    @route 'item', ->
      @route 'new'
      @route 'edit'
      @route 'delete'

`export default routing`
