Promise = require("bluebird")
req = Promise.promisify(require("request"))
_ = require("lodash")
InvalidResponseError = require("../errors").InvalidResponseError

nem = (addr) ->
  url = "http://127.0.0.1:7890/account/get/forwarded?address=#{addr.replace(/-/g,'')}"

  req(url, json: true)
    .timeout(1000)
    .cancellable()
    .spread (resp, json) ->
      console.log json
      if resp.statusCode in [200..299]
        status: "success"
        protocol: "NEM"
        service: url
        address: addr
        quantity: json.account.balance
        asset: "XEM"
      else
        if _.isObject(json) and json.message == "error"
          []
        else
          throw new InvalidResponseError service: url, response: resp

    .catch Promise.TimeoutError, (e) ->
      [status: 'error', service: url, message: e.message, raw: e]
    .catch InvalidResponseError, (e) ->
      [status: "error", service: e.service, message: e.message, raw: e.response]

module.exports = nem
