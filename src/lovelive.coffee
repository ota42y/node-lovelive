yaml = require('js-yaml')
fs   = require('fs')
path = require('path')
FeedParser = require("feedparser")
request = require("request")

NEWS_SITE_URL = "http://news.lovelive-anime.jp/app-def/S-102/news/?feed=rss2"

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

  news: (callback) ->
    req = request(NEWS_SITE_URL)
    feedparser = new FeedParser()

    headline = []

    req.on "error", (error) ->
      console.log "error"

    req.on "response", (res) ->
      stream = this
      return @emit("error", new Error("Bad status code"))  unless res.statusCode is 200
      stream.pipe feedparser
      return

    feedparser.on "error", (error) ->
      console.log error
      return

    # always handle errors
    feedparser.on "readable", ->
      # This is where the action is!
      stream = this
      meta = @meta # **NOTE** the "meta" is always available in the context of the feedparser instance
      item = undefined
      while item = stream.read()
        headline.push item
      return

    feedparser.on "end", ->
      callback(headline)


module.exports.LoveLive = LoveLive
