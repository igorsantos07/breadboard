`import Ember from 'ember'`

ItemListComponent = Ember.Component.extend
  classNames: ['col-md-3', 'col-sm-3', 'col-xs-6']

  glyphicon: Ember.computed 'type', ->
    switch @attrs.type
      when 'customer' then 'user'
      when 'problem'  then 'thumbs-down'
      when 'solution' then 'thumbs-up'
      when 'risk'     then 'alert'

  plural: Ember.computed 'type', ->
    @attrs.type + 's'

  didInsertElement: ->
    $modal = $('#item-modal')
    $modal.on 'shown.bs.modal', ->
      $modal.find('input[type=text]:first').focus()


`export default ItemListComponent`
