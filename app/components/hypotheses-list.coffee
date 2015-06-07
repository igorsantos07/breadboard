`import Ember from 'ember'`

HypothesesListComponent = Ember.Component.extend
  classNames: ['col-lg-5', 'col-md-12']

  actions:
    infiniteImprobabilityGenerator: ->
      @getAttr('board').newRandomHypothesis()

    finiteImprobabilityGenerator: ->
      alert 'should open a nice modal'

  didInsertElement: ->
    $('th .btn-group button').tooltip
      container: 'body'

`export default HypothesesListComponent`
