LoveLive = require('../src/lovelive.coffee').LoveLive

describe "LoveLive", ->
  @lovelive = null

  describe "initialize", ->
    beforeEach (done) ->
      @lovelive = new LoveLive
      done()

    it 'initialize', (done)->
      assert.notEqual @lovelive, null
      done()

    it 'data set', (done) ->
      assert.notEqual @lovelive.call_and_response, null
      done()

  describe "getRandomResponse", ->
    beforeEach (done) ->
      @lovelive = new LoveLive
      done()

    it 'get data', (done) ->
      response = {'test': 100}
      assert.equal @lovelive.getRandomResponse(response), 'test'
      done()

  describe "call", ->
    beforeEach (done) ->
      @lovelive = new LoveLive
      done()

    it 'get response', (done) ->
      @lovelive.call_and_response = {"ファイトだよ": {"うんっ！": 100}}
      assert.equal @lovelive.call("ファイトだよ！"), "うんっ！"
      done()

    it 'get no response', (done) ->
      assert.equal @lovelive.call("完全にフルハウス"), null
      done()
