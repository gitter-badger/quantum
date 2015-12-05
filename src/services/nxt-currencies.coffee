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
    .map (currency) ->
      status: "success"
      service: url
      address: addr
      quantity: currency.units
      asset: currency.currency

    .catch Promise.TimeoutError, (e) ->
      [status: 'error', service: url, message: e.message, raw: e]
    .catch InvalidResponseError, (e) ->
      [status: "error", service: e.service, message: e.message, raw: e.response]

module.exports = nxt_assets
