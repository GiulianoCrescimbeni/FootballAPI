# FootballAPI
A simple Football API
- [What is it?](https://github.com/GiulianoCrescimbeni/FootballAPI/new/master?readme=1#what-is-this)
- [How it works?](https://github.com/GiulianoCrescimbeni/FootballAPI/new/master?readme=1#how-it-works)
- [Installation and usage](https://github.com/GiulianoCrescimbeni/FootballAPI/new/master?readme=1#installation-and-usage)
- [Conclusion](https://github.com/GiulianoCrescimbeni/FootballAPI/new/master?readme=1#conclusion)

# What is this?
As the title says, this is a small project that consists of a fast API to provide information about soccer teams or scorers in many leagues. You can get the full live ranking of one of the championships supported, get much information about a single squad, and more!

# How it works?
It consists of two parts: The data getting and the rest part to display it. In the ```/FootballScraper``` directory, you can find a file, called ```FootballScraper.py```, that is the web scraper used to get the data from a famous Italian sports website called ```https://www.gazzetta.it/```. Running that script will automatically get all the data that the API need, and will upload it into the SQL database. Instead, running the server.js file will start the node server for the proper data distribution. You can keep the web scraper file on to get live data in your DB, otherwise, you can use it whenever you want to refresh the data.

# Installation and usage
After downloading all the files, you will first need to set up the database. You will find the configuration file in the main directory, with the name of "FootballAPI.sql". Create a new database named "footballapi" and import the configuration file to set up everything. You will probably find some pre-filled data in the tables. These are old information, to get the right ones what we want to do is running the data scraper script, let's see how to do it.

First of all, you need to install [python3](https://www.python.org/downloads/), make sure it is installed properly by opening a cmd and typing the command ```python3```. After this, navigate to the ```FootballScraper``` folder and try to run the command ```python3 FootballScraper.py```. It will probably fail and return an error because you need to install all the right modules. To do so you need to run this 2 commands:
##### ```python3 -m pip install mysql```
##### ```python3 -m pip install beautifulsoup4```
Now you can run the file and it will constantly update data until you stop it. To get the server to work you will need to install [node.js](https://nodejs.org/it/download/). Run the command ```node``` to be sure it is installed properly, and then use the command ```node server.js``` to start the server. server.js is the main file that sets up a local server, while route.js is the file where all the routes and behaviors are stored. Now that the server is running you can open up your browser and type ```localhost:3000``` and you will be redirected to the main index. The front end is built with a powerful and light framework called [skeleton](http://getskeleton.com/). Enjoy your new API.

# Conclusion
That's all you need to know. If you find any bugs or have any suggestions, do not hesitate to contact me on telegram (@Giuliano_Crescimbeni). Enjoy :D
