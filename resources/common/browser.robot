*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${BASE_URL}         https://trailquest.global/
${BROWSER}          chrome
${TIMEOUT}          10s
${WINDOW_WIDTH}     1920
${WINDOW_HEIGHT}    1080
${MOBILE_MENU_BTN}  xpath=//button[contains(@class,'icon-menu')]
${NAVBAR}           xpath=//nav[contains(@class,'navbar')]

*** Keywords ***

Open Browser To Application
    [Documentation]    Opens browser with specified window size 1920x1080
    ${chrome_options}=    Evaluate    selenium.webdriver.ChromeOptions()    modules=selenium.webdriver

    # Add window size argument
    ${window_size_arg}=    Set Variable    --window-size\=${WINDOW_WIDTH},${WINDOW_HEIGHT}
    Call Method    ${chrome_options}    add_argument    ${window_size_arg}
    Call Method    ${chrome_options}    add_argument    --start-maximized
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --no-sandbox

    Open Browser    ${BASE_URL}    ${BROWSER}    options=${chrome_options}
    Set Selenium Timeout    ${TIMEOUT}

    # Ensure window is set to exact size
    Set Window Size    ${WINDOW_WIDTH}    ${WINDOW_HEIGHT}

Close Browser Session
    [Documentation]    Closes the current browser session
    Close Browser