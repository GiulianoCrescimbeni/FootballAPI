module.exports = function (api, path, fs) {

  function competitionToURL(squadName) {
    var data =fs.readFileSync('conf/competitions.txt', 'utf8')
    var tuples = data.split("\n");

    for(i = 0; i < tuples.length; i++) {
      var tuple = tuples[i].split(":");
      if(squadName == tuple[0]) {
        return tuple[1];
      }
    }

    return "null";
  }

  function decodeUtf8(bytes) {
    var encoded = "";
    for (var i = 0; i < bytes.length; i++) {
        encoded += '%' + bytes[i].toString(16);
    }
    return decodeURIComponent(encoded);
  } 

  //Squads Routes//
  //General squad getter//
  api.get("/:championship/table", (req, res, next) => {
    //Use python shell//
    const {PythonShell} = require("python-shell");
    var competition = competitionToURL(req.params.championship)

    if(competition == "null") {
      res.json("Competition not found")
      return
    }

    let options = {
      mode: 'text',
      path: '/FootballScraper/',
      pythonOptions: ['-u'], // get print results in real-time
      args: [competition]
    };

    PythonShell.run('SquadStatsScraper.py', options, function (err, data) {
        if (err) throw err;
        res.json(JSON.parse(JSON.parse(data)));
    });
  });

  //Squad from squad name//
  api.get("/:championship/table/squadname/:squadName", (req, res, next) => {
    //Use python shell//
    const {PythonShell} = require("python-shell");
    var competition = competitionToURL(req.params.championship)

    if(competition == "null") {
      res.json("Competition not found")
      return
    }

    var filters = "name-" + req.params.squadName

    let options = {
      mode: 'text',
      path: '/FootballScraper/',
      pythonOptions: ['-u'], // get print results in real-time
      args: [competition, filters]
    };

    PythonShell.run('SquadStatsScraper.py', options, function (err, data) {
      if (err) throw err;
      res.json(JSON.parse(JSON.parse(data)));
    });
  });

  //Squad from squad position//
  api.get("/:championship/table/squadposition/:squadposition", (req, res, next) => {
    //Use python shell//
    const {PythonShell} = require("python-shell");
    var competition = competitionToURL(req.params.championship)

    if(competition == "null") {
      res.json("Competition not found")
      return
    }

    var filters = "position-" + req.params.squadposition

    let options = {
      mode: 'text',
      path: '/FootballScraper/',
      pythonOptions: ['-u'], // get print results in real-time
      args: [competition, filters]
    };

    PythonShell.run('SquadStatsScraper.py', options, function (err, data) {
      if (err) throw err;
      res.json(JSON.parse(JSON.parse(data)));
    });
  });

  //News//
  api.get("/:championship/news/", (req, res, next) => {
    //Use python shell//
    const {PythonShell} = require("python-shell");
    var competition = competitionToURL(req.params.championship)

    if(competition == "null") {
      res.json("Competition not found")
      return
    }

    let options = {
      mode: 'text',
      path: '/FootballScraper/',
      pythonOptions: ['-u'], // get print results in real-time
      args: [competition]
    };

    PythonShell.run('NewsChampionshipScraper.py', options, function (err, data) {
      if (err) throw err;
      res.json(JSON.parse(JSON.parse(data)));
    });
  });

  //Results//
  api.get("/:championship/results/", (req, res, next) => {
    //Use python shell//
    const {PythonShell} = require("python-shell");
    var competition = competitionToURL(req.params.championship)

    if(competition == "null") {
      res.json("Competition not found")
      return
    }

    let options = {
      mode: 'text',
      path: '/FootballScraper/',
      pythonOptions: ['-u'], // get print results in real-time
      args: [competition]
    };

    PythonShell.run('ResultsScraper.py', options, function (err, data) {
      if (err) throw err;
      res.json(JSON.parse(JSON.parse(data)));
    });
  });

  //Fixtures//
  api.get("/:championship/fixtures/", (req, res, next) => {
    //Use python shell//
    const {PythonShell} = require("python-shell");
    var competition = competitionToURL(req.params.championship)

    if(competition == "null") {
      res.json("Competition not found")
      return
    }

    let options = {
      mode: 'text',
      path: '/FootballScraper/',
      pythonOptions: ['-u'], // get print results in real-time
      args: [competition]
    };

    PythonShell.run('FixturesScraper.py', options, function (err, data) {
      if (err) throw err;
      res.json(JSON.parse(JSON.parse(data)));
    });
  });

  //List of all competitions//
  api.get("/competitions", (req, res, next) => {

    var competitions = "{"
    
    var data =fs.readFileSync('conf/competitions.txt', 'utf8')
    var tuples = data.split("\n");

    for(i = 0; i < tuples.length; i++) {
      var tuple = tuples[i].split(":");
      if(i == 0) {
        competitions = competitions + tuple[0];
      } else {
        competitions = competitions + ',' + tuple[0];
      }
    }

    competitions = competitions + "}";
    res.json(competitions);
    
  });

  //Today Matches//

  }
