parseURL = (require 'url').parse
_ = require 'lodash'

module.exports = ({appKey, apiUrl})->
	create: (uid, data, complete)->
		throw 'uid is required' if !uid?

		option =
			method: 'post'
			url: parseURL "#{apiUrl}/users.json"
			qs : data ? {}

		option.qs.pio_appkey = appKey
		option.qs.pio_uid = uid

		request option, (err, res, body)->
			(complete ? data) {err:err, res:res, body:body}
			
	get: (uid, complete)->
		throw 'uid is required' if !uid?

		option = 
			method: 'get'
			url: '/users/#{uid}.json'

		request option, (err, res, body)->
			complete {err:err, res:res, body:body}
		
	delete: (uid)->
		throw 'uid is required' if !uid?

		option =
			method: 'delete'
			url: '/users/#{uid}.json'

		request option, (err, res, body)->
			complete {err:err, res:res, body:body}
