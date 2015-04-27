`import ParseModel from './-parse-model'`

Item = ParseModel.extend
  type:        DS.attr 'string'
  title:       DS.attr 'string'
  description: DS.attr 'string'
#  hypotheses:  DS.hasMany 'hypothesis', async: true

`export default Item`
