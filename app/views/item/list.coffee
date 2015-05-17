`import Ember from 'ember'`

itemListView = Ember.View.extend
  templateName: 'board/items'
  classNames: ['item-list', 'col-md-3', 'col-sm-3', 'col-xs-6']
  plural: (-> @title + 's').property('title')

  addItem: ->
    console.log arguments

`export default itemListView`
