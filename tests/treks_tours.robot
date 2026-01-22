*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource    ../resources/page_objects/home_page.robot
Resource    ../resources/page_objects/treks_tours.robot
Test Teardown    Close Browser

*** Test Cases ***
Treks and Tours Test
    Open Homepage
    Test The Push Your Limit
    Test KanchenjungaTrek
    Test Everest Via Gokyo_Trek
    Scroll Element Into View    xpath=/html/body/div[1]/header/div[1]/div/div/div/a/img[1]
    Test Annapurna Circuit Trek
    Scroll Element Into View    xpath=/html/body/div[1]/header/div[1]/div/div/div
    Test Manaslu Circuit Trek
    Test Annapurna Base Camp
    #Scroll Element Into View    xpath=/html/body/div[1]/header/div[1]/div/div/div/div/div[2]/div[2]
    Test Everest Base Camp
#Facebook Button
#    Open Homepage
#    Test Facebook
#Twitter Button
#    Open Homepage
#    Test Twitter





