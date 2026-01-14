*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${BASE_URL}    https://trailquest.global/
${BROWSER}     Chrome
${TIMEOUT}     10s

*** Keywords ***
Open Browser To Application
    ${chrome_options}=    Evaluate    selenium.webdriver.ChromeOptions()    modules=selenium.webdriver
    ${args}=    Create List
    ...    --window-size=1920,1080
    ...    --start-maximized
    ...    --no-sandbox
    ...    --disable-dev-shm-usage
    ...    --disable-gpu
    ...    --disable-software-rasterizer
    ...    --remote-debugging-port=9222
    ...    --disable-extensions
    ...    --disable-setuid-sandbox

    FOR    ${arg}    IN    @{args}
        Call Method    ${chrome_options}    add_argument    ${arg}
    END

    Open Browser    ${BASE_URL}    ${BROWSER}    options=${chrome_options}

Close Browser Session
    Close Browser

