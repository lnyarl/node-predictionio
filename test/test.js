
var PredictionIO = require('../out/lib/predict');

var appKey = 'AZKeX9jT2WZQU3VdSiPGWLTpjjKnWoqDLvc33gUqx9gddbfwftuike8M01lFwQ65';
var apiUrl = 'http://localhost:8000';

var client = new PredictionIO(appKey, apiUrl);

client.createUser('mage', {}, function(err, res, body){
  console.log("=== create user");
  console.log(JSON.stringify(err, null, '   '));
  //console.log(JSON.stringify(res, null, '   '));
  console.log(JSON.stringify(body, null, '   '));
});

client.getUser('mage', function(err, res, body){
  console.log("=== get user");
  console.log(JSON.stringify(err, null, '   '));
  //console.log(JSON.stringify(res, null, '   '));
  console.log(JSON.stringify(body, null, '   '));
});
