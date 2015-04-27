`import ParseModel from './-parse-model'`

Board = ParseModel.extend
  name:        DS.attr 'string'
  hyp_valid:   DS.attr 'number', defaultValue: 0
  hyp_invalid: DS.attr 'number', defaultValue: 0
  hyp_total:   DS.attr 'number', defaultValue: 0
  project:     DS.belongsTo 'project', async: true, inverse: 'boards'

`export default Board`
