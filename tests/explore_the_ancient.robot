*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource    ../resources/page_objects/home_page.robot
Resource    ../resources/page_objects/Explore_The_Ancient.robot
Test Teardown    Close Browser
*** Test Cases ***
Explore The Ancient Tests
    [Tags]    regression    ui    ancient
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


