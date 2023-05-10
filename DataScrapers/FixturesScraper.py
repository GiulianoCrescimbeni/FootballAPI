import bs4
import requests
import sched
import time
import json
import sys
from urllib.request import urlopen as uReq
from bs4 import BeautifulSoup as soup

#Getting the name of the championship#
championship = str(sys.argv[1])

#Opening the connection with the site#
uClient = uReq("https://onefootball.com/en/competition/"+championship+"/fixtures/")
page_html = uClient.read()
uClient.close()

#Souping the page and getting data#
page_soup = soup(page_html,"html.parser")
matches_day = page_soup.findAll("of-match-cards-list")
matchesDays_list = []
data = "[{"
first = 1

for days in matches_day:
    
    match_day_container = days.find("h3", {"class":"title-7-medium section-header__subtitle"}) 
    match_day = match_day_container.text
    if(first == 1):
        data = data + '"' + match_day + '" : ['
        first = 0
    else:
        data = data + ',"' + match_day + '" : ['
        
    matches = days.findAll("li", {"class":"simple-match-cards-list__match-card"})
    matches_list = []
    i = 0
    for match in matches:
        squad_logo_container = match.findAll("div", {"class":"of-image"})
        squad1_logo = squad_logo_container[0].find("img", attrs = {'src' : True})['src']
        squad2_logo = squad_logo_container[1].find("img", attrs = {'src' : True})['src']
        squad_name = match.findAll("span", {"class":"title-8-medium simple-match-card-team__name"})
        squad1_name = squad_name[0].text[1:-1]
        squad2_name = squad_name[1].text[1:-1]
        match_date_container = match.find("time", {"class":"title-8-bold"})
        match_time_container = match.find("time", {"class":"simple-match-card__info-message title-8-medium"})
        match_time = match_time_container.text
        match_played = match.find("div", {"class":"simple-match-card__highlights"})

        if not match_date_container:
            match_date = "PostPoned"
        else:
            match_date = match_date_container.text.replace(" ","")
        
        if match_played:
            match_date = "Played"

        if(i == 0):
            data = data + '{"homeLogo":"'+ squad1_logo +'","homeTeam":"'+ squad1_name +'","awayLogo":"'+ squad2_logo +'","awayTeam":"'+squad2_name+'","MatchDay":"'+match_date+'","MatchTime":"'+match_time+'"}'
        else:
            data = data + ',{"homeLogo":"'+ squad1_logo +'","homeTeam":"'+ squad1_name +'","awayLogo":"'+ squad2_logo +'","awayTeam":"'+squad2_name+'","MatchDay":"'+match_date+'","MatchTime":"'+match_time+'"}'
        i = i + 1
    data = data + "]"

data = data + "}]"
json_dump = json.dumps(data)
print(json_dump)
exit()
