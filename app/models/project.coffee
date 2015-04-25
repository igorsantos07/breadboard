`import ParseModel from './parse-model'`

Project = ParseModel.extend
  name:         DS.attr 'string'
  boards:       DS.hasMany 'board'

`export default Project`
