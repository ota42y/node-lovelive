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

  getRandomResponse: (response) ->
    sum = 0
    for key in Object.keys(response)
      sum += response[key]

    rand = Math.floor(Math.random() * (sum+1));
    check = 0
    for key in Object.keys(response)
      check += response[key]
      if rand <= check
        return key

    throw new Error("can't decide response data (maybe bug)")

  call: (call) ->
    for call_regexp in Object.keys(@call_and_response)
      if call.match(call_regexp)
        return @getRandomResponse(@call_and_response[call_regexp])
    return null

module.exports.LoveLive = LoveLive
