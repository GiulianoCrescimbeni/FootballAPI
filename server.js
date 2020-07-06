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
    database: "FootballAPI",
});

api.get('/', function(req, res) {
  res.sendFile(path.join(__dirname + '/index.html')); 
});

api.get('/index.html',function(req,res){
  res.sendFile(path.join(__dirname + '/index.html')); 
});

api.get("/squads", (req, res, next) => {
  con.query("SELECT * FROM teams", function(err, result, fields) {
    if(result) {
      res.setHeader('Content-Type', 'application/json');
      res.send(result);
    } else {
      res.json("No squads found");
    }
  });
});

api.get("/squads/squadname/:squadName", (req, res, next) => {
    con.query("SELECT * FROM teams WHERE squad_name = '" + req.params.squadName + "'", function(err, result, fields) {
      if(result) {
        res.setHeader('Content-Type', 'application/json');
        res.send(result);
      } else {
        res.json("No squads found");
      }
  });
});

api.get("/squads/squadposition/:squadposition", (req, res, next) => {
    con.query("SELECT * FROM teams WHERE squad_position = '" + req.params.squadposition + "'", function(err, result, fields) {
      if(result) {
        res.setHeader('Content-Type', 'application/json');
        res.send(result);
      } else {
        res.json("No squads found");
      }
  });
});
