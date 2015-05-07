`import ParseModel from './-parse-model'`

Project = ParseModel.extend
  name:        DS.attr 'string'
  boards:      DS.hasMany 'board', async: true, inverse: 'project', array: true
  hyp_valid:   DS.attr 'number', defaultValue: 0
  hyp_invalid: DS.attr 'number', defaultValue: 0
  hyp_total:   DS.attr 'number', defaultValue: 0

  didDelete: ->
    @get('boards').then (boards)-> boards.forEach (b)-> b.destroyRecord()

`export default Project`
