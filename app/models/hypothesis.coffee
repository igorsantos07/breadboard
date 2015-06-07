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
  ## -1 = invalid; 0 = unfinished validation; 1 = valid!
  status:            DS.attr 'number', defaultValue: 0
  text:              DS.attr 'string'

  defaultText: Ember.computed 'customer', 'problem', 'solution', 'risk', ->
    text = @get('customer').title + 'pode' + @get('problem').title
    if (solution = @get('solution'))
      text += '. Resolve com' + solution.title
    if (risk = @get('risk'))
      text += (if solution then ', mas pode ' else 'E talvez possa ') + risk.title
    return text

`export default Hypothesis`
