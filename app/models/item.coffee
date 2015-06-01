`import ParseModel from './-parse-model'`

Item = ParseModel.extend
  type:        DS.attr 'string'
  title:       DS.attr 'string'
  description: DS.attr 'string'
  board:       DS.belongsTo 'board', async: true
#  hypotheses:  DS.hasMany 'hypothesis', async: true, array: true

  #TODO: intelligent removal of an item's hypotheses
  didCreate: -> @get('board').then (b)-> b.save()
  didUpdate: -> @get('board').then (b)-> b.save()

  didDelete: ->
    @get('board').then (board)-> board.save()
    console.info 'Should manually find each hypothesis related and remove'

`export default Item`
