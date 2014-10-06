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
