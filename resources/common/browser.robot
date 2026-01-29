*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${BASE_URL}         https://trailquest.global/
${BROWSER}          chrome
${TIMEOUT}          10s
<<<<<<< HEAD
${WINDOW_WIDTH}     1920
${WINDOW_HEIGHT}    1080
=======
${HEADLESS}         True
>>>>>>> 12a6bb9 (ADDED TAGS)
${MOBILE_MENU_BTN}  xpath=//button[contains(@class,'icon-menu')]
${NAVBAR}           xpath=//nav[contains(@class,'navbar')]

*** Keywords ***
<<<<<<< HEAD
=======
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
>>>>>>> 12a6bb9 (ADDED TAGS)

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