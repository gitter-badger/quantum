Promise = require("bluebird")
req = Promise.promisify(require("request"))
_ = require("lodash")
InvalidResponseError = require("../errors").InvalidResponseError

nxt_assets = (addr) ->
  url = "http://localhost:7876/nxt?requestType=getAccountCurrencies&account=#{addr}"

  req(url, json: true)
    .timeout(10000)
    .cancellable()
    .spread (resp, json) ->
      if resp.statusCode in [200..299] and _.isArray(json.accountCurrencies)
        json.accountCurrencies
      else
        if _.isObject(json) and json.message == "error"
          []
        else
          throw new InvalidResponseError service: url, response: resp
    # .map (currency) ->
    #   assetUrl = "https://api.coinprism.com/v1/assets/#{currency.id}"
    #   req(assetUrl, json: true)
    #     .timeout(10000)
    #     .cancellable()
    #     .spread (resp, json) ->
    #       if resp.statusCode in [200..299]
    #         if _.isNull json
    #           # fail gracefully when asset definition is unknown
    #           _.merge currency, code: "#{currency.currency}", divisibility: 0
    #         else if json.currency == currency.currency
    #           _.merge currency, code: "#{json.code}", divisibility: json.decimals
    #       else
    #         throw new InvalidResponseError service: url, response: resp
    .map (currency) ->
      balance = parseInt(currency.units, 10)
      quantity = balance / (10 ** currency.decimals)

      status: "success"
      service: url
      address: addr
      quantity: quantity
      asset: currency.name

    .catch Promise.TimeoutError, (e) ->
      [status: 'error', service: url, message: e.message, raw: e]
    .catch InvalidResponseError, (e) ->
      [status: "error", service: e.service, message: e.message, raw: e.response]

module.exports = nxt_assets
