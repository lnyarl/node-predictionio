parseURL = (require "url").parse
_ = require "lodash"

module.exports = (appKey, apiUrl)->

  get: (iid, n, engine_name, data, callback)->
    throw "iid is required" if !iid?
    throw "number of recommended items is required" if !n?
    throw "engine name is required" if !engine_name?
    throw "callback is required" if !(_.isFunction callback ? data)

    option =
      method: "get"
      url: parseURL "#{apiUrl}/engines/itemsim/#{engine_name}/topn.json"
      qs:
        pio_appkey: appKey
        pio_iid: iid
        pio_n: n

    _.merge(option.qs, data)

    request option, (err, res, body) ->
      (callback ? data) err, res, body
