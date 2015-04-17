`import Ember from 'ember'`

IndexRoute = Ember.Route.extend
  model: ->
    @store.find('item').then (data)=>
      customers: data.filterProperty 'type', 'customer'
      problems: data.filterProperty 'type', 'problem'
      solutions: data.filterProperty 'type', 'solution'
      risks: data.filterProperty 'type', 'risk'
      hypotheses: @store.find 'hypothesis'
      new:
        customer: @store.createRecord 'item', type: 'customer'
        problem:  @store.createRecord 'item', type: 'problem'
        solution: @store.createRecord 'item', type: 'solution'
        risk:     @store.createRecord 'item', type: 'risk'

`export default IndexRoute`
