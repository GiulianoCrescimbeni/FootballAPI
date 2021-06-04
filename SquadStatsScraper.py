import bs4
import requests
import sched
import time
import json
import sys
from urllib.request import urlopen as uReq
from bs4 import BeautifulSoup as soup

class Squad:
    #Squad Class#
    def __init__(self, position, name, points, played, win, loose, tie):
        self.position = position
        self.name     = name
        self.points   = points
        self.played   = played
        self.win      = win
        self.loose    = loose
        self.tie      = tie

#Getting the name of the squad#
squad_name_url = str(sys.argv[1])

#Getting filters#
is_filtered = len(sys.argv) > 2
if is_filtered:
    filters = str(sys.argv[2]).split("-")
    parameter = filters[0]
    value = filters[1]

#Opening the connection with the site#
uClient = uReq("https://onefootball.com/it/competizione/"+squad_name_url+"/classifica")
page_html = uClient.read()
uClient.close()

#Souping the page and getting data#
page_soup = soup(page_html,"html.parser")
squads = page_soup.findAll("li", {"class":"standings__row standings__row--link"})
squads_list = []
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

    if(is_filtered):
        if(parameter == "position"):
            if(squad_position == value):
                squad_class = Squad(squad_position, squad_name, squad_points, squad_played, squad_win, squad_loose, squad_tie)
                squads_list.append(squad_class)
        elif(parameter == "name"):
            if(value in squad_name):
                squad_class = Squad(squad_position, squad_name, squad_points, squad_played, squad_win, squad_loose, squad_tie)
                squads_list.append(squad_class)
    else:
        squad_class = Squad(squad_position, squad_name, squad_points, squad_played, squad_win, squad_loose, squad_tie)
        squads_list.append(squad_class)

#    if(parameter == "position"):
#        if(squad_position == value):
#            data_set = '{ "Position":"'+squad_position+'", "Name":"'+squad_name+'", "Points":"'+squad_points+'", "Played":"'+squad_played+'", "Winned":"'+squad_win+'", "Loosed":"'+squad_loose+'", "Tie":"'+squad_tie+'"}'
#            data = data + data_set
#            break
#    else:
#        if(counter < len(squads)):
#            if(is_filtered):
#                #Applying name filter#
#                if(parameter == "name"):
#                    if(value in squad_name):
#                        data_set = '{ "Position":"'+squad_position+'", "Name":"'+squad_name+'", "Points":"'+squad_points+'", "Played":"'+squad_played+'", "Winned":"'+squad_win+'", "Loosed":"'+squad_loose+'", "Tie":"'+squad_tie+'"},'
#                        data = data + data_set
#            else:
#                data_set = '{ "Position":"'+squad_position+'", "Name":"'+squad_name+'", "Points":"'+squad_points+'", "Played":"'+squad_played+'", "Winned":"'+squad_win+'", "Loosed":"'+squad_loose+'", "Tie":"'+squad_tie+'"},'
#                data = data + data_set
#        else:
#            if(is_filtered):
#                #Applying name filter#
#                if(parameter == "name"):
#                    if(value in squad_name):
#                        data_set = '{ "Position":"'+squad_position+'", "Name":"'+squad_name+'", "Points":"'+squad_points+'", "Played":"'+squad_played+'", "Winned":"'+squad_win+'", "Loosed":"'+squad_loose+'", "Tie":"'+squad_tie+'"}'
#                        data = data + data_set
#            else:
#                data_set = '{ "Position":"'+squad_position+'", "Name":"'+squad_name+'", "Points":"'+squad_points+'", "Played":"'+squad_played+'", "Winned":"'+squad_win+'", "Loosed":"'+squad_loose+'", "Tie":"'+squad_tie+'"}'
#                data = data + data_set

else:
    for squad in squads_list:
        data_set = '{"Position":"'+squad.position+'", "Name":"'+squad.name+'", "Points":"'+squad.points+'", "Played":"'+squad.played+'", "Winned":"'+squad.win+'", "Loosed":"'+squad.loose+'", "Tie":"'+squad.tie+'"},'
        data = data + data_set

data = data[:-1] + "]"
json_dump = json.dumps(data)
print(json_dump)
