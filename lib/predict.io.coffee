/*
 * predict.io
 * https://github.com/mage/predict.io
 *
 * Copyright (c) 2013 yongjae choi
 * Licensed under the MIT license.
 */

Futures = require 'futures'
request = require 'request'
validator = require './validator'

module.exports = ()->

	class PredictionIO
		constructor: (appKey, apiUrl)->
			throw 'appKey and apiUrl is required' if !appKey? or !apiUrl?

			@user = (require './requestUser')(appKey, apiUrl)

		addUser: (userData, complete)->
			option = endpoint.user.add(appKey, appUrl, userData)

			result = {}
			request option, (err, res, body)->
				complete {err:err, res:res, body:body}
				
		getUser: (uid, complete)->
		deleteUser: (uid, complete)->

		addUserSync: (userData)->
		getUserSync: (uid)->
		deleteUserSync: (uid)->
		
		addItem: (itemData, complete)->
		getItem: (iid, complete)->
		deleteItem: (itemData, complete)->
		addItemSync: (itemData)->
		getItemSync: (iid)->
		deleteItemSync: (itemData)->

		action: (actionData, complete)->
		actionSync: (actionData)->

		recommand: (recommandData, complete)->
		similar: (SimilarData, complete)->
		recommandSync: (recommandData)->
		similarSync: (SimilarData)->
	PredictionIO
