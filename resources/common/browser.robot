*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${BASE_URL}         https://trailquest.global/
${BROWSER}          chrome
${TIMEOUT}          10s
${WINDOW_WIDTH}     1920
${WINDOW_HEIGHT}    1080
${HEADLESS}         True
${MOBILE_MENU_BTN}  xpath=//button[contains(@class,'icon-menu')]
${NAVBAR}           xpath=//nav[contains(@class,'navbar')]

*** Keywords ***

Open Browser To Application
    ${chrome_options}=    Evaluate    selenium.webdriver.ChromeOptions()    modules=selenium.webdriver

    # Detect OS so we can use safer flags on Windows vs Linux CI
    ${os}=    Get Operating System

    ${args}=    Create List
    ...    --window-size=1920,1080

    # Linux / CI-specific stability flags
    Run Keyword If    'Linux' in '${os}'    Append To List    ${args}    --no-sandbox
    Run Keyword If    'Linux' in '${os}'    Append To List    ${args}    --disable-dev-shm-usage
    Run Keyword If    'Linux' in '${os}'    Append To List    ${args}    --disable-setuid-sandbox

    # Common flags
    Append To List    ${args}    --disable-gpu
    Append To List    ${args}    --disable-software-rasterizer
    Append To List    ${args}    --remote-debugging-port=9222
    Append To List    ${args}    --disable-extensions

    # Headless flags: use modern flag on Linux CI, classic flag on Windows for better compatibility
    Run Keyword If    '${HEADLESS}'=='True' and 'Linux' in '${os}'      Append To List    ${args}    --headless=new
    Run Keyword If    '${HEADLESS}'=='True' and 'Windows' in '${os}'    Append To List    ${args}    --headless

Close Browser Session
    [Documentation]    Closes the current browser session
    Close Browser