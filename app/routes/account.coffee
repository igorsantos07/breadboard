`import Ember from 'ember'`
`import BasicRoute from './-route'`

AccountRoute = BasicRoute.extend
  beforeModel: ->
    console.warn 'Account stuff is not implemented yet'
    @transitionTo 'projects'

`export default AccountRoute`
