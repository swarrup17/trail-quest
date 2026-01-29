*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource    ../resources/page_objects/home_page.robot
Resource    ../resources/page_objects/Declutter_your_mind.robot
Test Teardown    Close Browser

*** Test Cases ***
Declutter Your Mind Test
    [Tags]    regression    ui    declutter
    Open Homepage
    Verify Logo Is Visible
    Open Trek And Tours Menu
    Test The Annapurna Reset
    Test The Mardi Path
    Test The Khopra Reset
    Test Ghandruk Reset

