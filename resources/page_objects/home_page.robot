*** Settings ***
Resource    ../common/browser.robot
Resource    ../common/keywords.robot
Resource    ../locators/home_page_locators.robot

*** Keywords ***
Open Homepage
    Open Browser To Application
    Sleep    2s

Verify Logo Is Visible
    Wait Until Element Is Visible    ${logo}
    Sleep    2s

Click Home Menu
    Wait And Click    ${home}
    sleep    2s

Open Trek And Tours Menu
    Wait And Click    ${trek_and_tours}
    sleep    2s

Click Push Your Limit
    Wait And Click    ${push_your_limit}
    sleep    2s

Click About Menu
    Wait And Click    ${About}
    sleep    2s

Click Contact Menu
    Wait And Click    ${Contact}
    sleep    2s

Click FAQ Menu
    Wait And Click    ${FAQ}
    sleep    2s

click all elements of homepage
    Verify Logo Is Visible
    Click Home Menu
    Open Trek And Tours Menu
    Click About Menu
    Click Contact Menu
    Click FAQ Menu
    Scroll Element Into View    xpath=/html/body/div[4]/div/section/div







