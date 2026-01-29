*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource    ../resources/page_objects/home_page.robot
Resource    ../resources/page_objects/reconnect_with_nature.robot
Test Teardown    Close Browser
*** Test Cases ***
Reconnect With Nature Test
    [Tags]    regression    ui    reconnect
    Open Homepage
    Verify Logo Is Visible
    Open Trek And Tours Menu
    Test Nepal Unbound Heritage to the pulse of wild
    Test The Valley Tales
    Test The Nepal Tales
    Test The Kalinchwok Crest


