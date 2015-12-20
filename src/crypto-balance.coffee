Promise = require("bluebird")
services = require('./services')
normalizeAssetName = require('./asset-names').normalize
regexp = require('./regexp-list')
formats = require("./format-list")

balance = (addr, callback) ->
  Promise
    .settle((fn(addr) if regexp[s].test(addr)) for s, fn of services)
    .timeout(5000)
    .cancellable()
    .map (pi) -> pi.isFulfilled() and pi.value()
    .filter (item) -> !!item
    .reduce (a, b) ->
      a.concat b
    , []
    .filter (asset) ->
      !asset.address or asset.address == addr
    .map (item) ->
      if item.address
        item.asset = normalizeAssetName(item.asset)
      if item.quantity != undefined
        item.quantity = formats[item.asset](item.quantity)
      item
    .nodeify callback


module.exports = balance

