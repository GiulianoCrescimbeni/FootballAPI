import bs4
import requests
import mysql.connector
import sched
import time
from urllib.request import urlopen as uReq
from bs4 import BeautifulSoup as soup
from mysql.connector import Error

serieaSquadURL = 'https://www.gazzetta.it/calcio/serie-a/classifica/'
serieaPlayerURL = 'https://www.gazzetta.it/calcio/serie-a/marcatori/'
premierLeagueSquadURL = 'https://www.gazzetta.it/calcio/premier-league/classifica/'
premierLeagueScorersURL = 'https://www.gazzetta.it/calcio/premier-league/marcatori/'
ligaSquadURL = 'https://www.gazzetta.it/calcio/liga/classifica/'
ligaPlayerURL = 'https://www.gazzetta.it/calcio/liga/marcatori/'
bundesligaSquadURL = 'https://www.gazzetta.it/calcio/bundesliga/classifica/'
bundesligaPlayerURL = 'https://www.gazzetta.it/calcio/bundesliga/marcatori/'
ligue1SquadURL = 'https://www.gazzetta.it/calcio/ligue-1/classifica/'
ligue1PlayerURL = 'https://www.gazzetta.it/calcio/ligue-1/marcatori/'

event_schedule = sched.scheduler(time.time, time.sleep)

def _main():
    #Main function to run all the scraping threads#
    _teams_scraper(serieaSquadURL, "serie_a_teams")
    _teams_scraper(premierLeagueSquadURL, "premier_league_teams")
    _teams_scraper(ligaSquadURL, "liga_teams")
    _teams_scraper(bundesligaSquadURL, "bundesliga_teams")
    _teams_scraper(ligue1SquadURL, "ligue1_teams")
    _scorers_scraper(serieaPlayerURL, "serie_a_scorers")
    _scorers_scraper(premierLeagueScorersURL, "premier_league_scorers")
    _scorers_scraper(ligaPlayerURL, "liga_scorers")
    _scorers_scraper(bundesligaPlayerURL, "bundesliga_scorers")
    _scorers_scraper(ligue1PlayerURL, "ligue1_scorers")
    event_schedule.enter(10, 10, _main())

def _teams_scraper(myurl, table):
    #Creating the connection with the database#
    try:
        connection = mysql.connector.connect(host='db4free.net',
                                             database='footballapi',
                                             user='giulianoc',
                                             password='Ciao1234',
                                             port='3306')
        cursor = connection.cursor()

        #Opening the connection with the site#
        uClient = uReq(myurl)
        page_html = uClient.read()
        uClient.close()

        #Souping the page and getting data#
        page_soup = soup(page_html,"html.parser")
        squads = page_soup.findAll("div", {"class":"sc-AxgMl fZcWz"})

        for squad in squads:
            #Scraping data from the hmtl#
            position = squad.div.div.div.div.text

            squad_name_container = squad.findAll("div", {"class":"sc-AxirZ beniop"})
            squad_name = squad_name_container[0].div.div.div.a.div.text

            squad_points_container = squad.findAll("div", {"class":"sc-AxirZ bUqtcc"})
            squad_points = squad_points_container[0].div.div.text

            squad_stats_container = squad.findAll("div", {"class":"sc-AxirZ brMDIw"})
            squad_played = squad_stats_container[1].div.div.text
            squad_win = squad_stats_container[2].div.div.text
            squad_loose = squad_stats_container[3].div.div.text
            squad_tie = squad_stats_container[4].div.div.text

            print("Position: " + position)
            print("Name: " + squad_name)
            print("Points: " + squad_points)
            print("Match Played: " + squad_played)
            print("Winned Match: " + squad_win)
            print("Loosed Match: " + squad_loose)
            print("Tie Match: " + squad_tie)
            print("----------------------")

            #Security layer to prevent sql injection#
            squad_name = squad_name.replace("'", "''")

            #Launching the update query to save data#
            sql = "UPDATE "+table+" SET squad_name = '"+squad_name+"', squad_points = '"+squad_points+"', squad_played = '"+squad_played+"', squad_winned = '"+squad_win+"', squad_loosed = '"+squad_loose+"', squad_tie = '"+squad_tie+"' WHERE squad_position = '"+position+"'"
            cursor.execute(sql)
            connection.commit()

    except mysql.connector.Error as error:
        #Connection Error#
        print("Connection Error: {}".format(error))
    finally:
        #Query runned correctly#
        #Closing the connection with the db#
        if (connection.is_connected()):
            connection.close()
            print("MySQL connection is closed")

def _scorers_scraper(myurl, table):
    #Creating the connection with the database#
    try:
        connection = mysql.connector.connect(host='db4free.net',
                                             database='footballapi',
                                             user='giulianoc',
                                             password='Ciao1234',
                                             port='3306')
        cursor = connection.cursor()

        #Opening the connection with the site#
        uClient = uReq(myurl)
        page_html = uClient.read()
        uClient.close()

        #Souping the page and getting data#
        page_soup = soup(page_html,"html.parser")
        players = page_soup.findAll("div", {"class":"sc-AxgMl fZcWz"})

        player_position = 0

        for player in players:
            #Scraping data from the hmtl#
            player_position += 1

            player_container = player.findAll("div", {"class":"sc-AxirZ tuFar"})
            player_name = player_container[0].div.div.div.a.div.text
            player_squad = player_container[1].div.div.div.a.div.text

            player_role_container = player.findAll("div", {"class":"sc-AxirZ fVjCQy"})
            player_role = player_role_container[0].div.div.text

            player_goals_container = player.findAll("div", {"class":"sc-AxirZ gMbwRA"})
            player_goals = player_goals_container[0].div.div.text

            player_penalties_container = player.findAll("div", {"class":"sc-AxirZ flwmbm"})
            player_penalties = player_penalties_container[0].div.div.text

            #Translating the player position from italian to english#
            player_role = translate(player_role)

            print("Position: " + str(player_position))
            print("Name: " + player_name)
            print("Squad: " + player_squad)
            print("Role: " + player_role)
            print("Goals: " + player_goals)
            print("Penalties: " + player_penalties)
            print("----------------------")

            #Security layer to prevent sql injection#
            player_name = player_name.replace("'", "''")
            player_squad = player_squad.replace("'", "''")

            #Launching the update query to save data#
            sql = "UPDATE "+table+" SET player_name = '"+player_name+"', player_squad = '"+player_squad+"', player_role = '"+player_role+"', player_goals = '"+player_goals+"', player_penalties = '"+player_penalties+"' WHERE player_position = '"+str(player_position)+"'"
            cursor.execute(sql)
            connection.commit()


    except mysql.connector.Error as error:
        #Connection Error#
        print("Connection Error: {}".format(error))
    finally:
        #Query runned correctly#
        #Closing the connection with the db#
        if (connection.is_connected()):
            connection.close()
            print("MySQL connection is closed")

#Translator Function#
def translate(x):
    return {
        'Attaccante ': "Striker",
        'Centrocampista ': "Midfielder",
        'Difensore ': "Defender",
        'Portiere ': "Goalkeeper"
    }.get(x)

event_schedule.enter(10, 1, _main())
event_schedule.run()
