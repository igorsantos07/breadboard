`import Ember from 'ember'`

ItemListComponent = Ember.Component.extend
  classNames: ['col-md-3', 'col-sm-3', 'col-xs-6']

  glyphicon: Ember.computed 'type', ->
    icon = switch @attrs.type
      when 'customer' then ['user', 'primary']
      when 'problem'  then ['thumbs-down', 'danger']
      when 'solution' then ['thumbs-up', 'success']
      when 'risk'     then ['alert', 'warning']
    "glyphicon-#{icon[0]} text-#{icon[1]}"

  plural: Ember.computed 'type', ->
    @attrs.type + 's'

  didInsertElement: ->
    $modal = $('#item-modal')
    $modal.on 'shown.bs.modal', ->
      $modal.find('input[type=text]:first').focus()


`export default ItemListComponent`
