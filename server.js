var express = require("express");
var mysql = require("mysql");
var path = require("path");
var PORT = process.env.PORT || 3000

var api = express();
api.listen(PORT, () => {
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

var con;

//var con = initializeConnection({
//      host: "db4free.net",
//    user: "giulianoc",
//    password: "Ciao1234",
//    database: "footballapi",
//    port: "3306",
//});

api.get('/', function(req, res) {
  res.sendFile(path.join(__dirname + '/index.html'));
});

api.get('/index.html',function(req,res){
  res.sendFile(path.join(__dirname + '/index.html'));
});

api.use(express.static(__dirname));
require('./routes.js')(api, con, path);
