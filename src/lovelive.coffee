yaml = require('js-yaml')
fs   = require('fs')

class LoveLive
  constructor: () ->
    @data = null

  load_data: () ->
    @data = yaml.safeLoad(fs.readFileSync('call_and_response.yml', 'utf8'));

module.exports.LoveLive = LoveLive
