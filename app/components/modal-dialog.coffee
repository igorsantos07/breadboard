`import Ember from 'ember'`

ModalDialogComponent = Ember.Component.extend
  actions:
    ok: (action)->
      console.log "calling sendAction for #{action}"
      this.sendAction action

`export default ModalDialogComponent`
