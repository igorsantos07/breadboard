`import ParseModel from './-parse-model'`

Item = ParseModel.extend
  type:        DS.attr 'string'
  title:       DS.attr 'string'
  description: DS.attr 'string'
  board:       DS.belongsTo 'board', async: true
#  hypotheses:  DS.hasMany 'hypothesis', async: true, array: true

  #TODO: intelligent removal of an item's hypotheses
  didDelete: ->
    console.warn 'Should manually find each hypothesis related and remove'

`export default Item`
