import bs4
import requests
import mysql.connector
import sched
import time
from urllib.request import urlopen as uReq
from bs4 import BeautifulSoup as soup
from mysql.connector import Error

myurl = 'https://www.gazzetta.it/calcio/serie-a/classifica/?refresh_ce-cp'
event_schedule = sched.scheduler(time.time, time.sleep)

def scraper():
    #Creating the connection with the database#
    try:
        connection = mysql.connector.connect(host='localhost',
                                             database='FootballAPI',
                                             user='root',
                                             password='')
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

            #Launching the update query to save data#
            sql = "UPDATE teams SET squad_name = '"+squad_name+"', squad_points = '"+squad_points+"', squad_played = '"+squad_played+"', squad_winned = '"+squad_win+"', squad_loosed = '"+squad_loose+"', squad_tie = '"+squad_tie+"' WHERE squad_position = '"+position+"'"
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

    event_schedule.enter(10, 1, scraper)

event_schedule.enter(10, 1, scraper)
event_schedule.run()