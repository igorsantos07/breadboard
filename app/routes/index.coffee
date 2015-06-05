`import Ember from 'ember'`
`import BasicRoute from './-route'`

IndexRoute = BasicRoute.extend
  meta: ->
    original = @_super()
    property:
      _.extend original.property,
        'og:site_name': 'ProtoBoard'
        'og:locale': 'en_US'
#        'og:locale:alternate': [] #other languages this could be available
        'og:type': 'website'
        'og:url': window.location.href
        'og:image': "#{window.location.origin}/img/logo.png"
        'og:title': document.title
#        'og:article:author': model.get('owner.name')

`export default IndexRoute`
