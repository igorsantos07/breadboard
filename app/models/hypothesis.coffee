`import DS from 'ember-data'`

Hypothesis = DS.Model.extend
  customer:          DS.belongsTo 'item', async: true
  problem:           DS.belongsTo 'item', async: true
  solution:          DS.belongsTo 'item', async: true
  risk:              DS.belongsTo 'item', async: true
  method:            DS.attr 'string'
  criterion_total:   DS.attr 'number'
  criterion_valid:   DS.attr 'number'
  criterion_invalid: DS.attr 'number'
  status:            DS.attr 'boolean', defaultValue: null
  text:              DS.attr 'string'

  defaultText: (->
    text = @get('customer').title + 'pode' + @get('problem').title
    if (solution = @get('solution'))
      text += '. Resolve com' + solution.title
    if (risk = @get('risk'))
      if (solution)
        text += ', mas pode' + risk.title
      else
        text += 'E talvez possa ' + risk.title

    return text
  ).property 'customer', 'problem', 'solution', 'risk'

`export default Hypothesis`
