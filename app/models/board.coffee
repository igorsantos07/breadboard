`import ParseModel from './parse-model'`

Board = ParseModel.extend
  name:        DS.attr 'string'
  hyp_valid:   DS.attr 'number'
  hyp_invalid: DS.attr 'number'
  hyp_total:   DS.attr 'number'
  project:     DS.belongsTo 'project'

`export default Board`
