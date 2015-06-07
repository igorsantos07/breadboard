`import Ember from 'ember'`

HypothesesListComponent = Ember.Component.extend
  classNames: ['col-lg-5', 'col-md-12']

  actions:
    infiniteImprobabilityGenerator: ->
      @getAttr('board').newRandomHypothesis()

    finiteImprobabilityGenerator: ->
      alert 'should open a nice modal'

  didInsertElement: ->
    $('[data-toggle=tooltip]').tooltip
      container: 'body'
    $('#filters').on 'show.bs.collapse hide.bs.collapse', ->
      $('[data-target=#filters]').toggleClass('active')

`export default HypothesesListComponent`
