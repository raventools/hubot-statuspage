chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'hello-world', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()

    require('../src/statuspage')(@robot)

  it 'registers a respond listener for incidents', ->
    expect(@robot.respond).to.have.been.calledWith(/(?:status|statuspage) incidents\??/i)
  it 'registers a respond listener for update', ->
    expect(@robot.respond).to.have.been.calledWith(/(?:status|statuspage) update (investigating|identified|monitoring|resolved) (.+)/i)
  it 'registers a respond listener for open', ->
    expect(@robot.respond).to.have.been.calledWith(/(?:status|statuspage) open (investigating|identified|monitoring|resolved) ([^:]+)(: ?(.+))?/i)
  it 'registers a respond listener for status', ->
    expect(@robot.respond).to.have.been.calledWith(/(?:status|statuspage)\?$/i)
  it 'registers a respond listener for update incident status', ->
    expect(@robot.respond).to.have.been.calledWith(/(?:status|statuspage) ((?!(incidents|open|update|resolve|create))(\S ?)+)\?$/i)
  it 'registers a respond listener for update component', ->
    expect(@robot.respond).to.have.been.calledWith(/(?:status|statuspage) ((\S ?)+) (major( outage)?|degraded( performance)?|partial( outage)?|operational)/i)
