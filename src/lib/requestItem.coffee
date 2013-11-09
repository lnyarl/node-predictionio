parseURL = (require "url").parse
_ = require "lodash"

module.exports = (appKey, apiUrl)->

  create: (iid, itypes, data, callback)->
    throw "iid is required" if !iid?
    throw "itypes is required" if !itypes?
    throw "callback is required" if !(_.isFunction callback ? data)

    option =
      method: "post"
      url: parseURL "#{apiUrl}/items.json"
      form:
        pio_appkey: appKey
        pio_iid: iid
        pio_itypes: itypes

    _.merge(option.form, data ? {})

    request option, (err, res, body) ->
      (callback ? data) err, res, body

  get: (iid, callback)->
    throw "iid is required" if !iid?
    throw "callback is required" if !_.isFunction callback

    option =
      method: "get"
      url: parseURL "#{apiUrl}/items/#{iid}.json"
      qs:
        pio_appkey: appKey

    request option, (err, res, body) ->
      callback err, body

  delete: (iid, callback)->
    throw "iid is required" if !iid?
    throw "callback is required" if !_.isFunction callback

    option =
      method: "delete"
      url: parseURL "#{apiUrl}/items/#{iid}.json"
      qs:
        pio_appkey: appKey

    request option, (err, res, body) ->
      callback err, res, body
