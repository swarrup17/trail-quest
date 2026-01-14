*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BASE_URL}    https://trailquest.global/
${BROWSER}     Chrome
${TIMEOUT}     10s

*** Keywords ***
Open Browser To Application
    Open Browser    ${BASE_URL}    ${BROWSER}
    Set Window Size    1920    1080
    Set Selenium Timeout    ${TIMEOUT}

Close Browser Session
    Close Browser

