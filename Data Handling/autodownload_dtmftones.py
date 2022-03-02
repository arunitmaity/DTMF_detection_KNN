import time
from selenium import webdriver
from selenium.webdriver.support.select import Select
from selenium.webdriver.common.keys import Keys
#SETUP
lf = [697, 770, 852, 941]
hf = [1209, 1336, 1477, 1633]
i = 12
x = 0
y = 0
driver = webdriver.Chrome("D:\PROJECTS\python_project\chromedriver.exe")
driver.get("https://www.audiocheck.net/audiofrequencysignalgenerator_dual.php")
time.sleep(25)
driver.find_element_by_name("duration").clear()
driver.find_element_by_name("duration").send_keys("0.1")
dropdown = Select(driver.find_element_by_xpath(".//select[@name='fs']"))
dropdown.select_by_value("8000")

def send_data(a,b):
    driver.find_element_by_name("level1").clear()
    driver.find_element_by_name("level1").send_keys(a)

    driver.find_element_by_name("level2").clear()
    driver.find_element_by_name("level2").send_keys(b)
    for f1 in lf:
        for f2 in hf:
            driver.find_element_by_name("frequency1").clear()
            driver.find_element_by_name("frequency1").send_keys(f1)

            driver.find_element_by_name("frequency2").clear()
            driver.find_element_by_name("frequency2").send_keys(f2)
            driver.find_element_by_name("frequency2").send_keys(Keys.RETURN)
            time.sleep(3)
    return;

while(i<18):
    send_data(-i,-i)
    for p in range(1,5):
        x = i + p
        if (x>20):
            continue
        if (i>18):
            continue
        send_data(-x,-i)
    for q in range(1,9):
        y = i + q
        if(y>18):
            continue
        if (i>20):
            continue
        send_data(-i,-y)
    i=i+1
