import bs4
import requests
import sched
import time
import json
import sys
from urllib.request import urlopen as uReq
from bs4 import BeautifulSoup as soup
from selenium import webdriver
from selenium.webdriver.common.keys import Keys


#Getting the name of the championship#
championship = str(sys.argv[1])

#Opening the connection with the site#
#uClient = uReq("https://onefootball.com/en/competition/"+championship+"/results/")
#page_html = uClient.read()
#uClient.close()

# Start web browser #
browser = webdriver.Chrome('./chromedriver')

# Get source code #
browser.get("https://onefootball.com/en/competition/"+championship+"/results/")
page_html = browser.page_source

#Souping the page and getting data#
page_soup = soup(page_html,"html.parser")
matches_day = page_soup.findAll("of-xpa-switch-entity-deprecated", {"class":"entity-page-root__item entity-page-root__item--simple-match-cards-list"})
matchesDays_list = []
data = "[{"
first = 1

for days in matches_day:
    
    match_day_container = days.find("p", {"class":"label simple-match-cards-list__title-deprecated"}) 
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
        squad_name = match.findAll("span", {"class":"title-8-medium simple-match-card-team__name"})
        squad1_name = squad_name[0].text
        squad2_name = squad_name[1].text

        squad_goals = match.findAll("span", {"class":"title-7-bold simple-match-card-team__score"})
        squad1_goals = squad_goals[0].text
        squad2_goals = squad_goals[1].text

        match_date_container = match.find("time", {"class":"title-8-bold simple-match-card__info-message--secondary"})
        match_date = match_date_container.text

        if(i == 0):
            data = data + '{"Squad1":"'+ squad1_name +'","Squad2":"'+squad2_name+'","Score1":"'+squad1_goals+'","Score2":"'+squad2_goals+'"}'
        else:
            data = data + ',{"Squad1":"'+ squad1_name +'","Squad2":"'+squad2_name+'","Score1":"'+squad1_goals+'","Score2":"'+squad2_goals+'","MatchDay":"'+match_date+'"}'
        i = i + 1
    data = data + "]"

data = data + "}]"
json_dump = json.dumps(data)
print(json_dump)
exit()
