*** Settings ***
Resource    ../common/browser.robot
Resource    ../common/keywords.robot
Resource    ../locators/home_page_locators.robot
*** Keywords ***
Verify Logo Is Visible
    Wait Until Element Is Visible    ${logo}
    Sleep    2s
Open Trek And Tours Menu
    Wait And Click    ${trek_and_tours}
    sleep    2s
Click Push Your Limit
    Wait And Click    ${push_your_limit}
    sleep    2s
#Test treks and tours
Test The Push Your Limit
    Verify Logo Is Visible
    Open Trek And Tours Menu
    Click Push Your Limit
    Scroll Element Into View    ${header}

    

