`import DS from 'ember-data'`

ParseModel = DS.Model.extend
  createdAt: DS.attr 'date'
  updatedAt: DS.attr 'date'

`export default ParseModel`
