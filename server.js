var express = require("express");
var mysql = require("mysql");
var path = require("path");

var api = express();
api.listen(3000, () => {
  console.log("API Server running on port 3000");
});

function initializeConnection(config) {
    function addDisconnectHandler(connection) {
        connection.on("error", function (error) {
            if (error instanceof Error) {
                if (error.code === "PROTOCOL_CONNECTION_LOST") {
                    console.error(error.stack);
                    console.log("Lost connection. Reconnecting...");

                    initializeConnection(connection.config);
                } else if (error.fatal) {
                    throw error;
                }
            }
        });
    }

    var connection = mysql.createConnection(config);
    addDisconnectHandler(connection);

    connection.connect();
    return connection;
}

var con = initializeConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "footballapi",
});

api.get('/', function(req, res) {
  res.sendFile(path.join(__dirname + '/index.html'));
});

api.get('/index.html',function(req,res){
  res.sendFile(path.join(__dirname + '/index.html'));
});

api.use(express.static(__dirname));
require('./routes.js')(api, con, path);
