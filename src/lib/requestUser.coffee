parseURL = (require "url").parse
_ = require "lodash"
request = require "request"

module.exports = (appKey, apiUrl)->

  create: (uid, data, callback)->
    throw "uid is required" if !uid?
    throw "callback is required" if !(_.isFunction (callback ? data))

    option =
      method: "post"
      url: parseURL "#{apiUrl}/users.json"
      form:
        pio_appkey: appKey
        pio_uid: uid

    _.merge(option.form, data) if !_.isFunction data

    request option, (err, res, body) ->
      (callback ? data) err, res, body

  update: (uid, data, callback)-> @create(uid, data, callback)

  get: (uid, callback)->
    throw "uid is required" if !uid?
    throw "callback is required" if !_.isFunction callback

    option =
      method: "get"
      url: parseURL "#{apiUrl}/users/#{uid}.json"
      qs:
        pio_appkey: appKey

    request option, (err, res, body) ->
      callback err, res, body

  delete: (uid, callback)->
    throw "uid is required" if !uid?
    throw "callback is required" if !_.isFunction callback

    option =
      method: "delete"
      url: parseURL "#{apiUrl}/users/#{uid}.json"
      qs:
        pio_appkey: appKey

    request option, (err, res, body) ->
      callback err, res, body
