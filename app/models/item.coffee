`import DS from 'ember-data'`

Item = DS.Model.extend
  type:        DS.attr 'string'
  title:       DS.attr 'string'
  description: DS.attr 'string'
  createdAt:   DS.attr 'date'
  updatedAt:   DS.attr 'date'
#  hypotheses:  DS.hasMany 'hypothesis', async: true

`export default Item`
