*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource    ../resources/page_objects/home_page.robot
Resource    ../resources/page_objects/Declutter_your_mind.robot
Resource    ../resources/page_objects/Explore_The_Ancient.robot
Resource    ../resources/page_objects/reconnect_with_nature.robot
Resource    ../resources/page_objects/treks_tours.robot
Test Teardown    Close Browser
*** Test Cases ***
Verify Homepage Header Buttons Are Clickable
    Open Homepage
    Click All Elements Of Homepage
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
Reconnect With Nature Test
    Open Homepage
    Verify Logo Is Visible
    Open Trek And Tours Menu
    Test Nepal Unbound Heritage to the pulse of wild
    Test The Valley Tales
    Test The Nepal Tales
    Test The Kalinchwok Crest
Explore The Ancient Tests
    Open Homepage
    Verify Logo Is Visible
    Open Trek And Tours Menu
    Test Off The Beaten
    Test Muktinath Tours
    Test Kathmandu Pokhara Lumbini
    Test 7 UNESCO Heritage
    Test KTM Valley Tour
    Test Narayanhiti Durbar
    Test Kathmandu Durbar
Declutter Your Mind Test
    Open Homepage
    Verify Logo Is Visible
    Open Trek And Tours Menu
    Test The Annapurna Reset
    Test The Mardi Path
    Test The Khopra Reset
    Test Ghandruk Reset


