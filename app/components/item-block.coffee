`import Ember from 'ember'`

itemComponent = Ember.Component.extend
  classNames: ['thumbnail']
  actions:
    toggleDetails: ->
      @toggleProperty 'showDetails'

    remove: ->
      item = @getAttr 'item'
      if confirm "Are you sure you want to remove the #{item.get('type')} \"#{item.get('title')}\"?"
        @toggleProperty 'showDetails'
        item.destroyRecord()

`export default itemComponent`
