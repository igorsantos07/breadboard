`import ParseModel from './-parse-model'`

Project = ParseModel.extend
  name:        DS.attr 'string'
  boards:      DS.hasMany 'board'
  hyp_valid:   DS.attr 'number', defaultValue: 0
  hyp_invalid: DS.attr 'number', defaultValue: 0
  hyp_total:   DS.attr 'number', defaultValue: 0

`export default Project`
