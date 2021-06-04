import bs4
import requests
import sched
import time
import json
import sys
from urllib.request import urlopen as uReq
from bs4 import BeautifulSoup as soup

#Getting the name of the squad#
squad_name_url = str(sys.argv[1])

#Opening the connection with the site#
uClient = uReq("https://onefootball.com/it/competizione/"+squad_name_url+"/classifica")
page_html = uClient.read()
uClient.close()

#Souping the page and getting data#
page_soup = soup(page_html,"html.parser")
squads = page_soup.findAll("li", {"class":"standings__row standings__row--link"})
data = "["
counter = 0

for squad in squads:
    counter = counter + 1
    #Scraping data from the hmtl#
    squad_stats = squad.findAll("span", {"class":"title-7-regular"})
    squad_position = squad_stats[0].text

    squad_name_container = squad.find("p", {"class":"title-7-regular standings__team-name"})
    squad_name = squad_name_container.text

    squad_points_container = squad.find("span", {"class":"title-7-bold"})
    squad_points = squad_points_container.text

    squad_played = squad_stats[1].text
    squad_win = squad_stats[2].text
    squad_loose = squad_stats[3].text
    squad_tie = squad_stats[4].text

    if(counter < len(squads)):
        data_set = '{ "Position":"'+squad_position+'", "Name":"'+squad_name+'", "Points":"'+squad_points+'", "Played":"'+squad_played+'", "Winned":"'+squad_win+'", "Loosed":"'+squad_loose+'", "Tie":"'+squad_tie+'"},'
    else:
        data_set = '{ "Position":"'+squad_position+'", "Name":"'+squad_name+'", "Points":"'+squad_points+'", "Played":"'+squad_played+'", "Winned":"'+squad_win+'", "Loosed":"'+squad_loose+'", "Tie":"'+squad_tie+'"}'
    data = data + data_set

data = data + "]"
json_dump = json.dumps(data)

print(json_dump)
