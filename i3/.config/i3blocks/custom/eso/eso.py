from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver.firefox.options import Options



URL = 'https://esoserverstatus.net/'

# DRIVER = webdriver.Firefox()
OPTIONS = Options()
OPTIONS.headless = True
DRIVER = webdriver.Firefox(options=OPTIONS)

DRIVER.get(URL)

DRIVER.implicitly_wait(15)

STATUS = DRIVER.find_element_by_css_selector('.list-group-item:nth-child(2) .badge > b')

print(STATUS.text)

#if STATUS.text == "Offline":
    #print("<span color=\"red\">",STATUS.text,"💀</span>")
#else:
#    print("<span color=\"green\">",STATUS.text,"😎 </span>")

DRIVER.close()