`import Ember from 'ember'`

ModalDialogComponent = Ember.Component.extend
  actions:
    save: (action)->
      console.log action, this

`export default ModalDialogComponent`
