*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource    ../resources/page_objects/home_page.robot
Resource    ../resources/page_objects/treks_tours.robot
Test Teardown    Close Browser
*** Test Cases ***
Reconnect With Nature Test
    Open Homepage
    Verify Logo Is Visible
