module.exports =
	user:
		create: ()->
			method: 'post'
			url: '/users.json'
		get: (uid)->
			method: 'get'
			url: '/users/#{uid}.json'
		delete: (uid)->
			method: 'delete'
			url: '/users/#{uid}.json'

	item:
		create: ()->
			method: 'post'
			url: '/items.json'
		get: (iid)->
			method: 'get'
			url: '/items/#{iid}.json'
		delete: (iid)->
			method: 'delete'
			url: '/items/#{iid}.json'

	action:
		rate:
			method: 'post'
			url: '/actions/u2i.json'
			form : 
				pio_action: 'rate'
		like:
			method: 'post'
			url: '/actions/u2i.json'
			form : 
				pio_action: 'like'
		dislike:
			method: 'post'
			url: '/actions/u2i.json'
			form : 
				pio_action: 'dislike'
		view:
			method: 'post'
			url: '/actions/u2i.json'
			form : 
				pio_action: 'view'
		conversion: ()->
			method: 'post'
			url: '/actions/u2i.json'
			form : 
				pio_action: 'conversion'

	recommendation:
		get: (engineName)->
			method: 'get'
			url: '/engines/itemrec/#{engineName}/topn.json'
	similiarity
		get: (engineName)->
			method: 'get'
			url: '/engines/itemsim/#{engineName}/topn.json'
