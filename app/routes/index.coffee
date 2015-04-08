`import Ember from 'ember'`

items = [{
  type: 'customer'
  title: 'Congressista'
  description: 'Todos que participam de eventos, circuitos de palestras, congressos, encontros, etc'
}, {
  type: 'customer'
  title: 'Organizador'
  description: 'Quem organiza e planeja eventos'
}, {
  type: 'problem'
  title: 'Perder prazo de compra do ingresso/lote'
  description: ''
}, {
  type: 'solution'
  title: 'Push Notifications'
  description: ''
}, {
  type: 'risk'
  title: 'Faltar de um dispositivo'
  description: 'Vai que o cara não é muito tecnológico e não tem um celular/tablet moderninho?'
}]

hypothesis = [{
  customer: items[0]
  problem:  items[2]
  solution: items[3]
  risk: items[4]
  method: 'Interview'
  criterion: '10/20'
}]

IndexRoute = Ember.Route.extend
  model: ->
    customers: _.filter items, (i) -> i.type == 'customer'
    problems:  _.filter items, (i) -> i.type == 'problem'
    solutions: _.filter items, (i) -> i.type == 'solution'
    risks:     _.filter items, (i) -> i.type == 'risk'
    hypothesis: hypothesis

`export default IndexRoute`
