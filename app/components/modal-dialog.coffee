`import Ember from 'ember'`

ModalDialogComponent = Ember.Component.extend
  actions:
    ok: (action)->
      console.log 'calling sendAction for confirm-action'
      this.sendAction 'confirm-action'

`export default ModalDialogComponent`
