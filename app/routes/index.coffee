`import Ember from 'ember'`

IndexRoute = Ember.Route.extend
  model: ->
    @store.find('item').then (data)=>
      return {
        customers: data.filterProperty 'type', 'customer'
        problems: data.filterProperty 'type', 'problem'
        solutions: data.filterProperty 'type', 'solution'
        risks: data.filterProperty 'type', 'risk'
        hypotheses: @store.find 'hypothesis'
      }

`export default IndexRoute`
