`import ParseModel from './-parse-model'`

Hypothesis = ParseModel.extend
  customer:          DS.belongsTo 'item', async: true
  problem:           DS.belongsTo 'item', async: true
  solution:          DS.belongsTo 'item', async: true
  risk:              DS.belongsTo 'item', async: true
  board:             DS.belongsTo 'board', async: true
  method:            DS.attr 'string'
  criterion_total:   DS.attr 'number', defaultValue: 0
  criterion_valid:   DS.attr 'number', defaultValue: 0
  criterion_invalid: DS.attr 'number', defaultValue: 0
  status:            DS.attr 'number', defaultValue: 0
  text:              DS.attr 'string'

  STATUS:
    invalid: -1
    pending: 0
    valid: 1

  getStatusStr: (num)->
    _.findKey @STATUS, (v)-> v == status

  #TODO: not yet used, so not tested
  setStatus: (status)->
    if status != @STATUS['valid'] && status != @STATUS['invalid'] && status != @STATUS['pending']
      throw Error('Status field must be one of Hypothesis.STATUS values')

    if @get('status') != status
      old_status = @get 'status'
      @set 'status', status
      @save()
      new_status_str = @getStatusStr status
      old_status_str = @getStatusStr old_status
      @get('board').then (board)->
        board.incrementProperty "hyp_#{new_status_str}" if new_status_str != 'pending'
        board.decrementProperty "hyp_#{old_status_str}" if old_status_str != 'pending'
        board.save()

  didCreate: ->
    @get('board').then (board)->
      board.incrementProperty 'hyp_total'
      board.save()

  didDelete: ->
    @get('board').then (board)=>
      if @get('status') == @STATUS['valid']
        board.decrementProperty 'hyp_valid'
      else if @get('status') == @STATUS['invalid']
        board.decrementProperty 'hyp_invalid'

      board.decrementProperty 'hyp_total'
      board.save()

`export default Hypothesis`
