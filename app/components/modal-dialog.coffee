`import Ember from 'ember'`

ModalDialogComponent = Ember.Component.extend
  actions:
    ok: (action)->
      this.sendAction 'confirm-action'

`export default ModalDialogComponent`
