yaml = require('js-yaml')
fs   = require('fs')
path = require('path')

class LoveLive
  constructor: () ->
    @call_and_response = {}
    @loadYaml()

  loadYaml: ->
    yaml_data = yaml.safeLoad(fs.readFileSync(path.resolve(__dirname, 'call_and_response.yml'), 'utf8'));

    for data in yaml_data
      call_array = data['call']
      for call in call_array
        @registCallAndResponse call, data['response']

  registCallAndResponse: (call, response) ->
    @call_and_response[call] = response

module.exports.LoveLive = LoveLive
