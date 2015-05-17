`import Ember from 'ember'`
`import config from './config/environment'`

Router = Ember.Router.extend
  location: config.locationType

routing = Router.map ->
  @route 'account', ->#TODO
    @route 'sign-up'  #TODO
    @route 'login'    #TODO
    @route 'details'  #TODO
    @route 'edit'     #TODO
    @route 'billing'  #TODO
    @route 'plans'    #TODO
  @route 'projects'
  @route 'board', path: '/:project_name/:board_name_id', ->
    @route 'item', -> #TODO
      @route 'new'    #TODO
      @route 'edit'   #TODO
      @route 'delete' #TODO

`export default routing`
