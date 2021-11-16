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

    let options = {
      mode: 'text',
      path: '/FootballScraper/',
      pythonOptions: ['-u'], // get print results in real-time
      args: [competitionToURL(req.params.championship)]
    };

    PythonShell.run('SquadStatsScraper.py', options, function (err, data) {
        if (err) throw err;
        res.json(JSON.parse(JSON.parse(data)));
    });
  });

  //Squad from squad name//
  api.get("/:championship/squadname/:squadName", (req, res, next) => {
    //Use python shell//
    const {PythonShell} = require("python-shell");

    var filters = "name-" + req.params.squadName

    let options = {
      mode: 'text',
      path: '/FootballScraper/',
      pythonOptions: ['-u'], // get print results in real-time
      args: [competitionToURL(req.params.championship), filters]
    };

    PythonShell.run('SquadStatsScraper.py', options, function (err, data) {
      if (err) throw err;
      res.json(JSON.parse(JSON.parse(data)));
    });
  });

  //Squad from squad position//
  api.get("/:championship/squadposition/:squadposition", (req, res, next) => {
    //Use python shell//
    const {PythonShell} = require("python-shell");

    var filters = "position-" + req.params.squadposition

    let options = {
      mode: 'text',
      path: '/FootballScraper/',
      pythonOptions: ['-u'], // get print results in real-time
      args: [competitionToURL(req.params.championship), filters]
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

    let options = {
      mode: 'text',
      path: '/FootballScraper/',
      pythonOptions: ['-u'], // get print results in real-time
      args: [competitionToURL(req.params.championship)]
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

    let options = {
      mode: 'text',
      path: '/FootballScraper/',
      pythonOptions: ['-u'], // get print results in real-time
      args: [competitionToURL(req.params.championship)]
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

    let options = {
      mode: 'text',
      path: '/FootballScraper/',
      pythonOptions: ['-u'], // get print results in real-time
      args: [competitionToURL(req.params.championship)]
    };

    PythonShell.run('FixturesScraper.py', options, function (err, data) {
      if (err) throw err;
      res.json(JSON.parse(JSON.parse(data)));
    });
  });

  //Today Matches//

  }
