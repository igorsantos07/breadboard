`import Ember from 'ember'`

AccountRoute = Ember.Route.extend
  beforeModel: ->
    console.warn 'Account stuff is not implemented yet'
    @transitionTo 'projects'

`export default AccountRoute`
