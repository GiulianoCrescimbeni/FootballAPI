var express = require("express");
var mysql = require("mysql");
var path = require("path");
var fs = require('fs')

var PORT = process.env.PORT || 3000

var api = express();
api.listen(PORT, () => {
  console.log("API Server running on port 3000");
});

api.get('/', function(req, res) {
  res.sendFile(path.join(__dirname + '/index.html'));
});

api.get('/index.html',function(req,res){
  res.sendFile(path.join(__dirname + '/index.html'));
});

api.use(express.static(__dirname));
require('./routes.js')(api, path, fs);
