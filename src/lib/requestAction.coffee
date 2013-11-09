parseURL = (require "url").parse
_ = require "lodash"

module.exports = (appKey, apiUrl)->
  behavior = (action, uid, iid, data, callback)->
    throw "uid is required" if !uid?
    throw "iid is required" if !iid?
    throw "callback is required" if !(_.isFunction callback ? data)

    option =
      method: "post"
      url: parseURL "#{apiUrl}/actions/u2i.json"
      form :
        pio_appkey: appKey
        pio_action: action
        pio_uid: uid
        pio_iid: iid

    _.merge option.form data

    request option, (err, res, body) ->
      callback err, res, body

  rate: (uid, iid, data, callback)-> behavior 'rate', uid, iid, data, callback
  like: (uid, iid, data, callback)-> behavior 'like', uid, iid, data, callback
  dislike: (uid, iid, data, callback)-> behavior 'dislike', uid, iid, data, callback
  view: (uid, iid, data, callback)-> behavior 'view', uid, iid, data, callback
  conversion: (uid, iid, data, callback)-> behavior 'conversion', uid, iid, data, callback

