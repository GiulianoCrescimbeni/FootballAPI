module.exports = function (api, con, path) {

  function squadToTable(squadName) {
    switch (squadName) {
      case "seriea":
        return "serie_a";
        break;
      case "bundesliga":
        return "bundesliga"
        break
      case "premierleague":
        return "premier_league";
        break
      case "ligue1":
        return "ligue1";
        break;
      case "liga":
        return "liga";
        break;
      default: "null"
    }
  }

  //Squads Routes//
  //General squad getter//
  api.get("/:championship/squads/", (req, res, next) => {
    squadName = squadToTable(req.params.championship);
    con.query("SELECT * FROM "+squadName+"_teams", function(err, result, fields) {
      if(result) {
        res.setHeader('Content-Type', 'application/json');
        res.send(result);
      } else {
        res.json("No squads found");
      }
    });
  });

  //Squad from squad name//
  api.get("/:championship/squadname/:squadName", (req, res, next) => {
      squadName = squadToTable(req.params.championship);
      con.query("SELECT * FROM "+squadName+"_teams WHERE squad_name LIKE '%" + req.params.squadName + "%'", function(err, result, fields) {
        if(result) {
          res.setHeader('Content-Type', 'application/json');
          res.send(result);
        } else {
          res.json("No squads found");
        }
    });
  });

  //Squad from squad position//
  api.get("/:championship/squadposition/:squadposition", (req, res, next) => {
      squadName = squadToTable(req.params.championship);
      con.query("SELECT * FROM "+squadName+"_teams WHERE squad_position = '" + req.params.squadposition + "'", function(err, result, fields) {
        if(result) {
          res.setHeader('Content-Type', 'application/json');
          res.send(result);
        } else {
          res.json("No squads found");
        }
    });
  });

  //Scorers Routes//
  //General scorers getter//
  api.get("/:championship/scorers", (req, res, next) => {
    squadName = squadToTable(req.params.championship);
    con.query("SELECT * FROM "+squadName+"_scorers", function(err, result, fields) {
      if(result) {
        res.setHeader('Content-Type', 'application/json');
        res.send(result);
      } else {
        res.json("No scorers found");
      }
    });
  });

  //Scorer from name//
  api.get("/:championship/scorername/:scorername", (req, res, next) => {
    squadName = squadToTable(req.params.championship);
    con.query("SELECT * FROM "+squadName+"_scorers WHERE player_name LIKE '%" + req.params.scorername + "%'", function(err, result, fields) {
      if(result) {
        res.setHeader('Content-Type', 'application/json');
        res.send(result);
      } else {
        res.json("No scorers found");
      }
    });
  });

  //Scorer from position//
  api.get("/:championship/scorerposition/:scorerposition", (req, res, next) => {
    squadName = squadToTable(req.params.championship);
    con.query("SELECT * FROM "+squadName+"_scorers WHERE player_position = '" + req.params.scorerposition + "'", function(err, result, fields) {
      if(result) {
        res.setHeader('Content-Type', 'application/json');
        res.send(result);
      } else {
        res.json("No scorers found");
      }
    });
  });

  //Today Matches//
  api.get("/test", (req, res, next) => {

    //Use python shell//
    const {PythonShell} = require("python-shell");

    let options = {
      mode: 'text',
      pythonOptions: ['-u'], // get print results in real-time
      args: ['serie-a-13']
    };

    PythonShell.run('SquadStatsScraper.py', options, function (err, data) {
        if (err) throw err;
        res.json(JSON.parse(JSON.parse(data)));
    });
  });

}
