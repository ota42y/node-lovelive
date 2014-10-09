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
