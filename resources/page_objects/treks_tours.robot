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
Go Down to
    Scroll Element Into View    ${header}
    sleep    2s
Click Easy
    Wait And Click    ${easy}
Click Everest Picture
    Wait And Click    ${everest_picture}
    Wait Until Element Is Visible    ${everest_header}
#    Scroll Element Into View    ${nav_bar}
#    Wait And Click    ${intro}
#    Scroll Element Into View    ${nav_bar}
#    Wait And Click    ${KBYG}
#    Scroll Element Into View    ${nav_bar}
#    Wait And Click    ${highlights}
#    Scroll Element Into View    ${nav_bar}
#    Wait And Click    ${who_for}
Click All Sticky Navbar Links
    Scroll Element Into View    ${nav_bar}
    ${section}=    Get WebElement    xpath=//*[@data-section='nav-intro']
    ${nav_links}=    Get WebElements    xpath=//nav[contains(@class,'sticky-navbar')][1]//ul/li/a[contains(@class,'nav-link')]
    #${nav_links}=    Get WebElements    xpath=//nav[contains(@class,'sticky-navbar')][1]//ul/li/a[contains(@class,'nav-link')]

    FOR    ${link}    IN    @{nav_links}
        ${link_text}=    Get Text    ${link}
        Log    Clicking navbar link: ${link_text}

        Scroll Element Into View    ${link}
        Sleep    0.5s

        Click Element    ${link}
        Sleep    1s

        Capture Page Screenshot
    END

Test The Push Your Limit
    Verify Logo Is Visible
    Open Trek And Tours Menu
    Click Push Your Limit
    Go Down To
    Click Easy
    Click Everest Picture
    Click All Sticky Navbar Links
    Wait And Click    ${need_help}
Test Facebook
    Verify Logo Is Visible
    Open Trek And Tours Menu
    Click Push Your Limit
    Go Down To
    Click Easy
    Click Everest Picture
    Wait And Click    ${share}
    sleep    2s
    Wait Until Element Is Visible    ${facebook}
    Sleep    1s
    Wait And Click    ${facebook}
    Sleep    2s
    Capture Page Screenshot
Test Twitter
    Verify Logo Is Visible
    Open Trek And Tours Menu
    Click Push Your Limit
    Go Down To
    Click Easy
    Click Everest Picture
    Wait And Click    ${share}
    Sleep    2s
    Wait Until Element Is Visible    ${twitter}
    Sleep    1s
    Wait And Click    ${twitter}
    Sleep    2s
    Capture Page Screenshot


    
    




