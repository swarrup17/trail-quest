*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${BASE_URL}         https://trailquest.global/
${BROWSER}          Chrome
${TIMEOUT}          10s
${MOBILE_MENU_BTN}  xpath=//button[contains(@class,'icon-menu')]
${NAVBAR}           xpath=//div[contains(@class,'menu js-navList')]   # updated to match your HTML

*** Keywords ***
Open Browser To Application
    [Documentation]    Opens Chrome headless, maximized, with proper CI options
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    "--window-size=1920,1080"
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Open Browser    ${BASE_URL}    ${BROWSER}    options=${chrome_options}
    Maximize Browser Window

Close Browser Session
    [Documentation]    Closes the current browser session
    Close Browser

Click Navbar Elements
    [Documentation]    Clicks all navbar elements dynamically; handles mobile menu if needed
    ${is_mobile}=    Run Keyword And Return Status    Element Should Be Visible    ${MOBILE_MENU_BTN}    timeout=5s
    IF    ${is_mobile}
        Wait And Click    ${MOBILE_MENU_BTN}
        Sleep    1s
    END
    Wait Until Element Is Visible    ${NAVBAR}    timeout=10s
    ${links}=    Get WebElements    ${NAVBAR}//a
    FOR    ${link}    IN    @{links}
        Run Keyword And Ignore Error    Click Element    ${link}
        Sleep    0.5s
    END
