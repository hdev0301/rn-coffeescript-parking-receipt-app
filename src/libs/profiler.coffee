class Profiler
  constructor: ->
    @start = Date.now()
    @last = @start

  @profile: (fn) ->
    time = Date.now()
    fn()
    Date.now() - time

  tick: ->
    now = Date.now()
    delta = now - @last
    @last = now
    return delta

  tock: ->
    return Date.now() - @start

    
module.exports = Profiler
