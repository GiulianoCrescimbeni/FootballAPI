import bs4
import requests
import sched
import time
import json
import sys
from urllib.request import urlopen as uReq
from bs4 import BeautifulSoup as soup
#from selenium import webdriver
#from selenium.webdriver.common.keys import Keys


#Getting the name of the championship#
championship = str(sys.argv[1])

#Opening the connection with the site#
uClient = uReq("https://onefootball.com/en/competition/"+championship+"/transfers/")
page_html = uClient.read()
uClient.close()

#Souping the page and getting data#
page_soup = soup(page_html,"html.parser")
transfers = page_soup.findAll("of-transfer-card")
data = "["
i = 0

for transfer in transfers:
    transfer_title_container = transfer.find("div", {"class":"transfer-card__title"})
    transfer_type = transfer_title_container.find("p", {"class":"title-8-bold"}).text
    transfer_date = transfer_title_container.find("time", {"class":"title-8-regular transfer-card__title-time"}).text.replace(" ","")

    transfer_content_container = transfer.find("div", {"class":"transfer-card__content"})
    transfer_content_player_container = transfer_content_container.find("div", {"class":"transfer-card__content-player-info"})
    transfer_player_name = transfer_content_player_container.find("p", {"class":"title-7-bold transfer-card__content-player-info-name"}).text
    transfer_player_role = transfer_content_player_container.find("p", {"class":"title-8-regular transfer-card__content-player-info-position"}).text.replace(" ","")
    #transfer_squad_logo_container = transfer_content_container.find("of-entity-logo", {"class":"transfer-card__content-team"})
    #transfer_squad_logo = transfer_squad_logo_container.find("img", {"class":"of-image__img"})['src']

    transfer_renewal_container = transfer.find("p", {"class":"transfer-card__renewal-content"})
    if not transfer_renewal_container:
        transfer_secondary_content_container = transfer.find("div", {"class":"transfer-card__secondary-content"})
        transfer_old_club = transfer_secondary_content_container.find("p", {"class":"title-8-regular transfer-card__secondary-content-old-team"}).text
        transfer_new_club = transfer_secondary_content_container.find("p", {"class":"title-8-regular transfer-card__secondary-content-new-team"}).text
        
        transfer_card_footer = transfer.find("div", {"class":"transfer-card__footer"})
        transfer_price = transfer_card_footer.find("p", {"class":"title-8-bold transfer-card__footer-content"}).text.replace(" ","")
        
        transfer_renewal = ""
    else:
        transfer_renewal = transfer_renewal_container.find("span", {"class":"title-8-regular transfer-card__renewal-content-message"}).text
        transfer_old_club = ""
        transfer_new_club = ""
        transfer_price = ""
        
    if(i == 0):
        data = data + '{"transferType":"'+ transfer_type +'","transferDate":"'+ transfer_date +'","playerName":"'+ transfer_player_name +'","playerRole":"'+transfer_player_role+'","oldClub":"'+transfer_old_club+'","newClub":"'+transfer_new_club+'","price":"'+transfer_price+'","renewal":"'+transfer_renewal+'"}'
    else:
        data = data + ',{"transferType":"'+ transfer_type +'","transferDate":"'+ transfer_date +'","playerName":"'+ transfer_player_name +'","playerRole":"'+transfer_player_role+'","oldClub":"'+transfer_old_club+'","newClub":"'+transfer_new_club+'","price":"'+transfer_price+'","renewal":"'+transfer_renewal+'"}'
    i = i + 1

data = data + "]"
json_dump = json.dumps(data)
print(json_dump)
exit()