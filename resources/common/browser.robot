*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BASE_URL}    https://trailquest.global/
${BROWSER}     Chrome
${TIMEOUT}     10s

*** Keywords ***
Open Browser To Application
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Timeout    ${TIMEOUT}

Close Browser Session
    Close Browser

