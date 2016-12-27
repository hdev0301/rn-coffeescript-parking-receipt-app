class Channel
  messages: []
  resolves: []


  put: (message) =>
    if resolve = @resolves.shift()
      resolve(message)
    else
      @messages.push(message)


  take: =>
    if message = @messages.shift()
      Promise.resolve(message)
    else
      new Promise (resolve) => @resolves.push(resolve)


module.exports = Channel
