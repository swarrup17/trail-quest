*** Settings ***
Library    SeleniumLibrary
Resource   config.robot

*** Keywords ***
Open Browser To Application
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys

    Call Method    ${options}    add_argument    --headless=new
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --disable-gpu
    Call Method    ${options}    add_argument    --window-size=1920,1080

    Open Browser    ${BASE_URL}    chrome    options=${options}
    Set Selenium Timeout    ${TIMEOUT}
