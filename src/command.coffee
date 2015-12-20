_ = require("lodash")
balance = require("./crypto-balance")
formats = require("./format-list")

module.exports.run = ->
  addr = process.argv[2]

  unless addr
    console.log "Usage: balance <address>"
    process.exit 1

  balance addr
    .then (items) ->
      for item in items
        if item.status == 'success' && item.quantity != undefined
          # console.log 'place: command.coffee'
          # console.log item
          item.quantity = formats[item.asset](item.quantity)
          console.log "#{item.quantity} #{item.asset}"
        else
          console.error _.merge(item, raw: "[object]")
      process.exit 0
    .catch (error) ->
      console.error error
      process.exit 1

