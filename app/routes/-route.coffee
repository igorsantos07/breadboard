`import Ember from 'ember'`
`import RouteMetaMixin from 'ember-cli-meta-tags/mixins/route-meta'`

BasicRoute = Ember.Route.extend RouteMetaMixin,
  meta: ->
    property:
      'og:site_name': 'ProtoBoard'
      'og:locale': 'en_US'
#      'og:locale:alternate': [] #other languages this could be available
      'og:type': 'website'
      'og:url': window.location.href
      'og:image': "#{window.location.origin}/img/logo.png"
      'og:title': document.title
#      'og:article:author': model.get('owner.name')

`export default BasicRoute`
