import bs4
import requests
import sched
import time
import json
import sys
from urllib.request import urlopen as uReq
from bs4 import BeautifulSoup as soup

class News:
    #News Class#
    def __init__(self, link, image, title, preview, publisherLogo, publisherName, publisherDate):
        self.link           = link
        self.image          = image
        self.title          = title
        self.preview        = preview
        self.publisherLogo  = publisherLogo
        self.publisherName  = publisherName
        self.publisherDate  = publisherDate

#Getting the name of the championship#
championship = str(sys.argv[1])

#Opening the connection with the site#
uClient = uReq("https://onefootball.com/en/competition/"+championship)
page_html = uClient.read()
uClient.close()

#Souping the page and getting data#
page_soup   = soup(page_html,"html.parser")
news_total  = page_soup.findAll("of-news-teaser", {"class":"gallery__teaser gallery__teaser--desktop--xl gallery__teaser--tablet-landscape--xl gallery__teaser--tablet-portrait--xl gallery__teaser--mobile--xl"})
news_total  = news_total + page_soup.findAll("of-news-teaser", {"class":"gallery__teaser gallery__teaser--desktop--lg gallery__teaser--tablet-landscape--lg gallery__teaser--tablet-portrait--md gallery__teaser--mobile--xs"})
news_total  = news_total + page_soup.findAll("of-news-teaser", {"class":"gallery__teaser gallery__teaser--desktop--sm gallery__teaser--tablet-landscape--sm gallery__teaser--tablet-portrait--md gallery__teaser--mobile--xs"})
news_total  = news_total + page_soup.findAll("of-news-teaser", {"class":"gallery__teaser gallery__teaser--desktop--sm gallery__teaser--tablet-landscape--sm gallery__teaser--tablet-portrait--sm gallery__teaser--mobile--xs"})
news_total  = news_total + page_soup.findAll("of-news-teaser", {"class":"gallery__teaser gallery__teaser--desktop--md gallery__teaser--tablet-landscape--md gallery__teaser--tablet-portrait--sm gallery__teaser--mobile--xs"})
news_list   = []
data = "["
counter = 0

for news in news_total:
    counter = counter + 1
    #Scraping data from the hmtl#
    news_link_container = news.find("a", href=True)
    news_link = "https://onefootball.com" + news_link_container['href']

    image = news.find("img", attrs = {'src' : True})['src']

    title_container = news.find("h3", {"class":"teaser__title"})
    title = title_container.text
    preview_container = news.find("p", {"class":"teaser__preview"})
    preview = preview_container.text

    publisher_container = news.find("footer", {"class":"teaser__publisher publisher text-5"})
    publisher_logo = publisher_container.find("img", attrs = {'src' : True})['src']
    publisher_name_container = publisher_container.find("span", {"class":"publisher__name"})
    publisher_name = publisher_name_container.text
    publisher_date_container = publisher_container.find("time", {"class":"publisher__time"})
    publisher_date = publisher_date_container.text

    news_class = News(news_link, image, title, preview, publisher_logo, publisher_name, publisher_date)
    news_list.append(news_class)

i = 0
for news in news_list:
    if(i == 0):
        data_set = '{"NewsLink":"'+news.link+'", "Image":"'+news.image+'", "Title":"'+news.title+'", "PublisherLogo":"'+news.publisherLogo+'", "PublisherName":"'+news.publisherName+'", "PublisherDate":"'+news.publisherDate+'"}'
        i = i + 1
    else:
        data_set = ',{"NewsLink":"'+news.link+'", "Image":"'+news.image+'", "Title":"'+news.title+'", "PublisherLogo":"'+news.publisherLogo+'", "PublisherName":"'+news.publisherName+'", "PublisherDate":"'+news.publisherDate+'"}'
    data = data + data_set

data = data + "]"
json_dump = json.dumps(data)
print(json_dump)
exit()