import bs4
import requests
import sched
import time
import json
import sys
from urllib.request import urlopen as uReq
from bs4 import BeautifulSoup as soup

link = input("Insert link: ")

uClient = uReq(link)
page_html = uClient.read()
uClient.close()

page_soup = soup(page_html,"html.parser")
competitions = page_soup.findAll("a", {"class":"title-7-medium directory-link"})
f = open("competitions.txt", "a")

for competition in competitions:
    f.write(competition.text.lower().replace(" ","")+":"+competition['href'][16:]+"\n")
f.close()