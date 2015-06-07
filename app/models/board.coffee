`import ParseModel from './-parse-model'`

## Generator of computed dynamic property
# Based on http://stackoverflow.com/a/20623551/102960
# Generates a custom CP for given item type, with listing cache
# The CP, when first accessed, will return empty and trigger it's Promise;
#   When it's fulfilled it will set the CP to the final value, and that's going
#   to trigger data-binding updates
item_filter = (type)->
  list = [] unless list

  Ember.computed 'items', (k, v)->
    if arguments.length <= 1
      @get('items').then (items)=>
        list = items.filterProperty 'type', type
        @set "#{type}s", list
    return list

Board = ParseModel.extend
  name:        DS.attr 'string'
  hyp_valid:   DS.attr 'number', defaultValue: 0
  hyp_invalid: DS.attr 'number', defaultValue: 0
  hyp_total:   DS.attr 'number', defaultValue: 0
  project:     DS.belongsTo 'project', async: true, inverse: 'boards'
  items:       DS.hasMany 'item', async: true, inverse: 'board', array: true
  hypotheses:  DS.hasMany 'hypothesis', async: true, inverse: 'board', array: true

  name_id: Ember.computed 'name', 'id', -> "#{@get('name')}-#{@get('id')}"

  customers:  item_filter 'customer'
  problems:   item_filter 'problem'
  risks:      item_filter 'risk'
  solutions:  item_filter 'solution'

  getRandomItem: (type)->
    list = @get(type)
    chosen = _.random(0, list.length - 1)
    list[chosen]

  newRandomHypothesis: ->
    @store.createRecord('hypothesis',
      board: @
      customer: @getRandomItem 'customers'
      problem:  @getRandomItem 'problems'
      solution: @getRandomItem 'solutions'
      risk:     @getRandomItem 'risks'
    ).save().then => @save()

  didDelete: ->
    @get('items').then (items)-> items.forEach (i)-> i.destroyRecord()
    @get('hypotheses').then (hyps)-> hyps.forEach (h)-> h.destroyRecord()
    @get('project').then (proj)-> proj.save() if proj #saving the project without this board

`export default Board`
