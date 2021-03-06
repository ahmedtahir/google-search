should = require('chai').should()
google = require '..'

describe 'google-search', ->

  it 'should return count and data by default', (done) ->
    google 'node.js', (err, results) ->
      results.count.should.be.a 'number'
      results.data.should.be.a 'array'
      results.data.should.have.length.above 8
      done()

  it 'should return count and data at page 2', (done) ->
    google 'node.js', 2, (err, results) ->
      results.count.should.be.a 'number'
      results.data.should.be.a 'array'
      results.data.should.have.length.above 8
      done()

  it 'should return a error', (done) ->
    google 'kafjpwojfaskldjfa', (err, results) ->
      err.should.be.an 'object'
      err.error.should.equal 'No data'
      done()