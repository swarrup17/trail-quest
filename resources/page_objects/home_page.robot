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


Verify Homepage Header Buttons Are Clickable
    ${mobile_menu_visible}=    Run Keyword And Return Status
    ...    Wait Until Element Is Visible    xpath=//button[contains(@class,'icon-menu')]    5s

    IF    ${mobile_menu_visible}
        Wait And Click    xpath=//button[contains(@class,'icon-menu')]
        Wait Until Element Is Visible    xpath=//div[contains(@class,'js-navList')]    10s
    END

    Wait And Click    xpath=//a[normalize-space()='Home']

    Click Navbar Menu And Subitems    Treks & Tours    Push Your Limits    Reconnect With Nature    Declutter Your Mind    Explore The Ancients
    Click Navbar Menu And Subitems    About    Who We Are    Our Core Values    Why Choose trailQuest?    Our Squad    What We Rally For    Terms & Conditions    Privacy Policy

    Wait And Click    xpath=//a[normalize-space()='FAQs']
    Wait And Click    xpath=//a[normalize-space()='Contact']


Click Navbar Menu And Subitems
    [Arguments]    ${menu_name}    @{submenu_items}
    Wait And Click    xpath=//span[normalize-space()='${menu_name}']
    FOR    ${item}    IN    @{submenu_items}
        Wait And Click    xpath=//ul[contains(@class,'subnav')]//a[normalize-space()='${item}']
        Wait Until Page Contains Element    xpath=//body    5s

        ${mobile_menu_visible}=    Run Keyword And Return Status
        ...    Element Should Be Visible    xpath=//button[contains(@class,'icon-menu')]
        IF    ${mobile_menu_visible}
            Wait And Click    xpath=//button[contains(@class,'icon-menu')]
        END
        Wait And Click    xpath=//span[normalize-space()='${menu_name}']
    END


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
    #Click Home Menu
    Verify Homepage Header Buttons Are Clickable
#    Open Trek And Tours Menu
#    Click About Menu
#    Click Contact Menu
#    Click FAQ Menu
    Scroll Element Into View    xpath=/html/body/div[4]/div/section/div







