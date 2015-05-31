`import Ember from 'ember'`
`import config from './config/environment'`

Router = Ember.Router.extend
  location: config.locationType

if config.environment == 'prod'
  Router.reopen
    notifyAnalytics: (->
      ga 'send', 'pageview',
        page: @get 'url',
        title: @get 'url'
    ).on 'didTransition'

routing = Router.map ->
  @route 'account', ->
    @route 'sign-up'
    @route 'login'
    @route 'logout'
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
