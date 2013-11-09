###
prediction.io
https://github.com/lnyarl/node-predictionio

Copyright (c) 2013 yongjae choi

Futures = require 'futures'
request = require 'request'
validator = require './validator'
###

module.exports =
  class PredictionIO
    constructor: (appKey, apiUrl)->
      throw 'appKey and apiUrl is required' if !appKey? or !apiUrl?

      apiUrl = apiUrl.substr(0, apiUrl.length - 1) if apiUrl[apiUrl.length - 1] == '/'

      @user = (require './requestUser')(appKey, apiUrl)
      @item = (require './requestItem')(appKey, apiUrl)
      @action = (require './requestAction')(appKey, apiUrl)
      @recommandation = (require './requestRecommand')(appKey, apiUrl)
      @simility = (require './requestSimility')(appKey, apiUrl)

    createUser: (uid, data, callback)-> @user.create uid, data, callback
    getUser: (uid, callback)-> @user.get uid, callback
    deleteUser: (uid, callback)-> @user.delete uid, callback

    createUserSync: (uid, data)-> (Future.wrap @user.create)(uid, data).wait()
    getUserSync: (uid)-> (Future.wrap @user.get)(uid).wait()
    deleteUserSync: (uid)-> (Future.wrap @user.delete)(uid).wait()

    createItem: ()-> @item.create
    getItem: ()-> @item.get
    deleteItem: ()-> @item.delete

    createItemSync: (iid, itypes, data)-> (Future.wrap @item.create)(iid, itypes, data).wait()
    getItemSync: (iid)-> (Future.wrap @item.get)(iid).wait()
    deleteItemSync: (iid)-> (Future.wrap @item.delete)(iid).wait()

    action: (action, uid, iid, data, callback)->
      @action[action] uid, iid, data, callback

    actionSync: (action, uid, iid, data)->
      (Future.wrap @action[action])(uid, iid, data).wait()

    recommand: (recommandData, callback)->
    similar: (SimilarData, callback)->

    recommandSync: (recommandData)->
    similarSync: (SimilarData)->
