*** Settings ***
Library    Collections
Resource    ../common/browser.robot
Resource    ../common/keywords.robot
Resource    ../locators/home_page_locators.robot
Resource    home_page.robot
Resource    treks_tours.robot
*** Keywords ***
Click Reconnect With Nature
    Wait And Click    ${Reconnect_nature}
    sleep    2s
Test Reconnect With Nature
    Click Reconnect With Nature
    Wait Until Element Is Visible    ${Reconnect_with_nature_contents}
    Go Down To
    Wait And Click    ${wildlife_encounter}
    Sleep    2s
    Wait And Click    ${Soulful_Returns}
    Sleep  2s
    Scroll Element Into View    xpath=/html/body/section[2]
    Wait Until Element Is Visible    ${Soulful_Returns_contents}
    Sleep    1.5s
Test Nepal Unbound Heritage to the pulse of wild Navbar
        [Documentation]    Click all sticky navbar section links (Intro → FAQS)

    ${NAVBAR}     Set Variable    //nav[contains(@class,'sticky-navbar')]
    ${NAV_LINKS}  Set Variable    //nav[contains(@class,'sticky-navbar')]//ul/li/a[contains(@class,'nav-link')]

    Wait Until Element Is Visible    ${NAVBAR}    15s
    Scroll Element Into View         ${NAVBAR}
    Sleep    0.5s

    ${links}=    Get WebElements    ${NAV_LINKS}
    ${count}=    Get Length         ${links}
    Log    Found ${count} sticky navbar links

    FOR    ${index}    IN RANGE    ${count}
        ${links}=    Get WebElements    ${NAV_LINKS}
        ${link}=     Set Variable       ${links}[${index}]

        ${text}=     Get Text    ${link}
        Log    Clicking: ${text}

        Scroll Element Into View    ${link}
        Sleep    0.3s

        Wait Until Element Is Visible    ${link}    10s
        Wait Until Element Is Enabled    ${link}    10s

        ${clicked}=    Run Keyword And Return Status    Click Element    ${link}
        IF    not ${clicked}
            Execute Javascript    arguments[0].click();    ${link}
        END

        Sleep    0.6s
    END
Test Nepal Unbound Heritage to the pulse of wild
    Test Reconnect With Nature
    Wait And Click    ${Nepal_Unbound_Heritage}
    Wait Until Element Is Visible    ${Nepal_Unbound_Heritage_Content}
    Scroll Element Into View    xpath=/html/body/div[3]/nav
    Test Nepal Unbound Heritage to the pulse of wild Navbar
    Scroll Element Into View   ${Nepal_Unbound_Heritage_Content}

Test The Valley Tales Navbar
        [Documentation]    Click all sticky navbar section links safely

    ${STICKY_NAVBAR}    Set Variable    //nav[contains(@class,'sticky-navbar')]
    ${STICKY_LINKS}     Set Variable    //nav[contains(@class,'sticky-navbar')]//ul/li/a[contains(@class,'nav-link')]

    Wait Until Element Is Visible    ${STICKY_NAVBAR}    15s
    Scroll Element Into View         ${STICKY_NAVBAR}

    ${links}=    Get WebElements    ${STICKY_LINKS}
    ${count}=    Get Length         ${links}
    Log    Found ${count} sticky navbar links

    FOR    ${i}    IN RANGE    ${count}
        ${links}=    Get WebElements    ${STICKY_LINKS}
        ${link}=     Set Variable       ${links}[${i}]

        ${text}=     Get Text    ${link}
        Log    Clicking: ${text}

        Scroll Element Into View    ${link}
        Wait Until Element Is Visible    ${link}    10s

        ${clicked}=    Run Keyword And Return Status    Click Element    ${link}
        IF    not ${clicked}
            Execute Javascript    arguments[0].click();    ${link}
        END
    END

Test The Valley Tales
    Open Trek And Tours Menu
    Test Reconnect With Nature
    Wait And Click    ${The_valley_tales}
    Wait Until Element Is Visible    ${Valley_tales_content}
    Scroll Element Into View    xpath=/html/body/div[3]/nav
    Test The Valley Tales Navbar
    Scroll Element Into View    ${Valley_tales_content}

Test The Nepal Tales Navbar
    [Documentation]    Click all <a class="nav-link"> links inside the sticky navbar safely

    ${STICKY_NAVBAR}    Set Variable    //nav[contains(@class,'sticky-navbar')]
    ${STICKY_LINKS}     Set Variable    //nav[contains(@class,'sticky-navbar')]//ul/li/a[contains(@class,'nav-link')]

    Wait Until Element Is Visible    ${STICKY_NAVBAR}    15s
    Scroll Element Into View         ${STICKY_NAVBAR}

    ${links}=    Get WebElements    ${STICKY_LINKS}
    ${count}=    Get Length         ${links}
    Log    Found ${count} sticky navbar links

    FOR    ${i}    IN RANGE    ${count}
        # Re-fetch to avoid stale element reference
        ${links}=    Get WebElements    ${STICKY_LINKS}
        ${link}=     Set Variable       ${links}[${i}]

        ${text}=     Get Text    ${link}
        Log    Clicking navbar link: ${text}

        Scroll Element Into View    ${link}
        Wait Until Element Is Visible    ${link}    10s
        Wait Until Element Is Enabled    ${link}    10s

        ${clicked}=    Run Keyword And Return Status    Click Element    ${link}

        IF    not ${clicked}
            Log    JS fallback click for: ${text}
            Execute Javascript    arguments[0].click();    ${link}
        END

        Sleep    0.5s
    END
Test The Nepal Tales
    Open Trek And Tours Menu
    Test Reconnect With Nature
    Wait And Click    ${The_Nepal_tales}
    Wait Until Element Is Visible    ${Nepal_tales_content}
    Scroll Element Into View    xpath=/html/body/div[3]/nav
    Test The Nepal Tales Navbar
    Scroll Element Into View    ${Nepal_tales_content}

Test The Kalinchwok Crest Navbar
    [Documentation]    Click all section links inside sticky navbar <ul> safely

    ${STICKY_NAVBAR}    Set Variable    //nav[contains(@class,'sticky-navbar')]
    ${STICKY_LINKS}     Set Variable    //nav[contains(@class,'sticky-navbar')]//ul/li/a[contains(@class,'nav-link')]

    Wait Until Element Is Visible    ${STICKY_NAVBAR}    15s
    Scroll Element Into View         ${STICKY_NAVBAR}

    ${links}=    Get WebElements    ${STICKY_LINKS}
    ${count}=    Get Length         ${links}
    Log    Found ${count} sticky navbar links

    FOR    ${i}    IN RANGE    ${count}
        ${links}=    Get WebElements    ${STICKY_LINKS}
        ${link}=     Set Variable       ${links}[${i}]

        ${text}=     Get Text    ${link}
        Log    Clicking navbar link: ${text}

        Scroll Element Into View    ${link}
        Wait Until Element Is Visible    ${link}    10s
        Wait Until Element Is Enabled    ${link}    10s

        ${clicked}=    Run Keyword And Return Status    Click Element    ${link}

        IF    not ${clicked}
            Log    JS fallback click for: ${text}
            Execute Javascript    arguments[0].click();    ${link}
        END

        Sleep    0.5s
    END
Test The Kalinchwok Crest
    Open Trek And Tours Menu
    Test Reconnect With Nature
    Wait And Click    ${Kalinchwok_crest}  
    Wait Until Element Is Visible    ${Kalinchwok_crest_content}
    Scroll Element Into View    xpath=/html/body/div[3]/div/nav
    Test The Nepal Tales Navbar
    Scroll Element Into View    ${Kalinchwok_crest_content}






