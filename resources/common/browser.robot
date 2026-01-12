*** Settings ***
Library    SeleniumLibrary
Resource   config.robot

*** Keywords ***
Open Browser To Application
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Timeout    ${TIMEOUT}

Close Browser
    Capture Page Screenshot
    Close All Browsers