Promise = require("bluebird")
req = Promise.promisify(require("request"))
_ = require("lodash")
InvalidResponseError = require("../errors").InvalidResponseError

colored_coins = (addr) ->
  url = "https://api.coinprism.com/v1/addresses/#{addr}"

  req(url, json: true)
    .timeout(10000)
    .cancellable()
    .spread (resp, json) ->
      if resp.statusCode in [200..299] and _.isArray(json.assets)
        json.assets
      else
        if _.isObject(json) and json.message == "error"
          []
        else
          throw new InvalidResponseError service: url, response: resp
    .map (asset) ->
      status: "success"
      service: url
      address: addr
      quantity: asset.balance
      asset: asset.id

    .catch Promise.TimeoutError, (e) ->
      [status: 'error', service: url, message: e.message, raw: e]
    .catch InvalidResponseError, (e) ->
      [status: "error", service: e.service, message: e.message, raw: e.response]

module.exports = colored_coins
