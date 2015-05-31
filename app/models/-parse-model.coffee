`import DS from 'ember-data'`

ParseModel = DS.Model.extend
  createdAt: DS.attr 'date'
  updatedAt: DS.attr 'date'

  staticKey: Ember.computed 'id', -> @get('id') || Ember.guidFor @

`export default ParseModel`
