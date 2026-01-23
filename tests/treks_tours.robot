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
    Scroll Element Into View    xpath=/html/body/div[3]/div[1]/section[1]/div/div[1]
    Test Mardi
    Test Langtang
    Test Poon Hill
    Test Amayangri





#Facebook Button
#    Open Homepage
#    Test Facebook
#Twitter Button
#    Open Homepage
#    Test Twitter





