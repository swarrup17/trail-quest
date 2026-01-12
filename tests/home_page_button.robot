*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource    ../resources/page_objects/home_page.robot
Resource    ../resources/page_objects/treks_tours.robot
Test Teardown    Close Browser

*** Test Cases ***
Verify Homepage Header Buttons Are Clickable
    Open Homepage
    Click All Elements Of Homepage
Treks and Tours Test
    Open Homepage
    Test The Push Your Limit





