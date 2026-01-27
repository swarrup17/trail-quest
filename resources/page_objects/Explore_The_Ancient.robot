*** Settings ***
Library    Collections
Resource    ../common/browser.robot
Resource    ../common/keywords.robot
Resource    ../locators/home_page_locators.robot
Resource    home_page.robot
Resource    treks_tours.robot
*** Keywords ***
Click Explore The Ancient
    Wait And Click    ${explore_the_ancient}
    Sleep    2s

Test Off the beaten
    Click Explore The Ancient
    Wait Until Element Is Visible    ${explore_the_ancient_content}
    Go Down To
    Wait And Click    ${off_the_beaten}
    Wait Until Element Is Visible    xpath=//*[@id="tab-off-the-beaten"]/section/div/div/div/div[2]/div
    Sleep    1.5s


Test Forgotten Culture
    Wait And Click    ${forgotten_culture}
    Wait Until Element Is Visible    xpath=/html/body/div[3]/section/div/div/div[4]/section/div/div/div/div[2]
Test Muktinath Tours Navbar
    [Documentation]    Click all section links inside sticky navbar (Intro → FAQS)

    ${NAVBAR}=     Set Variable    xpath=//nav[contains(@class,'sticky-navbar')]
    ${NAV_LINKS}=  Set Variable    xpath=//nav[contains(@class,'sticky-navbar')]//ul//a[contains(@class,'nav-link')]

    # Wait for sticky navbar
    Wait Until Element Is Visible    ${NAVBAR}    15s
    Scroll Element Into View         ${NAVBAR}
    Sleep    0.5s

    # Get all section links (Intro → FAQS)
    ${links}=    Get WebElements    ${NAV_LINKS}
    ${count}=    Get Length         ${links}
    Log    Sticky navbar links found: ${count}

    FOR    ${index}    IN RANGE    ${count}
        # Re-fetch elements to avoid stale reference
        ${links}=    Get WebElements    ${NAV_LINKS}
        ${link}=     Set Variable       ${links}[${index}]

        ${text}=     Get Text    ${link}
        Log    Clicking: ${text}

        Scroll Element Into View        ${link}
        Wait Until Element Is Visible  ${link}    10s
        Wait Until Element Is Enabled  ${link}    10s

        ${status}=    Run Keyword And Return Status    Click Element    ${link}
        IF    not ${status}
            Execute Javascript    arguments[0].click();    ${link}
        END

        Sleep    0.6s
    END

Test Muktinath Tours
    Test Forgotten Culture
    Scroll Element Into View    xpath=/html/body/div[3]/section/div/div/div[4]/section/div/div/div/div[2]
    Wait And Click    ${Muktinath}
    Wait Until Element Is Visible    ${Muktinath_Content}
    Scroll Element Into View    xpath=/html/body/div[3]/nav
    Test Muktinath Tours Navbar
    Scroll Element Into View    ${Muktinath_Content}
Test KPL Navbar
    [Documentation]    Click all section links inside sticky navbar (Intro → FAQS)

    ${NAVBAR}=     Set Variable    xpath=//nav[contains(@class,'sticky-navbar')]
    ${NAV_LINKS}=  Set Variable    xpath=//nav[contains(@class,'sticky-navbar')]//ul//a[contains(@class,'nav-link')]

    # Ensure sticky navbar is visible
    Wait Until Element Is Visible    ${NAVBAR}    15s
    Scroll Element Into View         ${NAVBAR}
    Sleep    0.5s

    # Fetch all navbar links
    ${links}=    Get WebElements    ${NAV_LINKS}
    ${count}=    Get Length         ${links}
    Log    Found ${count} sticky navbar section links

    FOR    ${i}    IN RANGE    ${count}
        # Re-fetch to avoid stale element issues
        ${links}=    Get WebElements    ${NAV_LINKS}
        ${link}=     Set Variable       ${links}[${i}]

        ${text}=     Get Text    ${link}
        Log    Clicking section: ${text}

        Scroll Element Into View        ${link}
        Wait Until Element Is Visible  ${link}    10s
        Wait Until Element Is Enabled  ${link}    10s

        ${clicked}=    Run Keyword And Return Status    Click Element    ${link}
        IF    not ${clicked}
            Execute Javascript    arguments[0].click();    ${link}
        END

        Sleep    0.6s
    END

Test Kathmandu Pokhara Lumbini
    Open Trek And Tours Menu
    Click Explore The Ancient
    Test Forgotten Culture
    Scroll Element Into View    xpath=/html/body/div[3]/section/div/div/div[4]/section/div/div/div/div[2]
    Wait And Click    ${KPL}
    Wait Until Element Is Visible    ${KPL_Content}
    Scroll Element Into View    xpath=/html/body/div[3]/nav
    Test KPL Navbar
    Scroll Element Into View    ${KPL_Content}

Test Homestay
    Open Trek And Tours Menu
    Click Explore The Ancient
    Scroll Element Into View    xpath=/html/body/div[3]/section/div/div/ul
    Wait And Click    ${homestay}
    Scroll Element Into View    xpath=//*[@id="tab-homestays"]/section
Test 7 UNESCO Heritage Navbar
    [Documentation]    Click all section links inside sticky navbar (Intro → FAQS)

    ${NAVBAR}=     Set Variable    xpath=//nav[contains(@class,'sticky-navbar')]
    ${NAV_LINKS}=  Set Variable    xpath=//nav[contains(@class,'sticky-navbar')]//ul//a[contains(@class,'nav-link')]

    # Ensure navbar exists
    Wait Until Element Is Visible    ${NAVBAR}    15s
    Scroll Element Into View         ${NAVBAR}
    Sleep    0.5s

    # Get all section links
    ${links}=    Get WebElements    ${NAV_LINKS}
    ${count}=    Get Length         ${links}
    Log    Found ${count} sticky navbar links

    FOR    ${i}    IN RANGE    ${count}
        # Re-fetch to avoid stale element reference
        ${links}=    Get WebElements    ${NAV_LINKS}
        ${link}=     Set Variable       ${links}[${i}]

        ${text}=    Get Text    ${link}
        Log    Clicking section: ${text}

        Scroll Element Into View         ${link}
        Wait Until Element Is Visible    ${link}    10s
        Wait Until Element Is Enabled    ${link}    10s

        ${clicked}=    Run Keyword And Return Status    Click Element    ${link}
        IF    not ${clicked}
            Execute Javascript    arguments[0].click();    ${link}
        END

        Sleep    0.6s
    END

Test 7 UNESCO Heritage
    Test Homestay
    Wait And Click    ${UNESCO}
    Wait Until Element Is Visible    ${UNESCO_Content}
    Scroll Element Into View    Xpath=/html/body/div[3]/nav
    Test 7 UNESCO Heritage Navbar
    Scroll Element Into View    ${UNESCO_Content}

#Test KTM Valley Tour Navbar

Test KTM Valley Tour
    Test Homestay
    Wait And Click    ${KTM_Valley_Tour}
    Go Back
Test Narayanhiti Navbar
    [Documentation]    Click all section links inside sticky navbar (Intro → FAQS)

    ${NAVBAR}=     Set Variable    xpath=//nav[contains(@class,'sticky-navbar')]
    ${NAV_LINKS}=  Set Variable    xpath=//nav[contains(@class,'sticky-navbar')]//ul//a[contains(@class,'nav-link')]

    # Ensure navbar is present
    Wait Until Element Is Visible    ${NAVBAR}    15s
    Scroll Element Into View         ${NAVBAR}
    Sleep    0.5s

    # Collect all nav links
    ${links}=    Get WebElements    ${NAV_LINKS}
    ${count}=    Get Length         ${links}
    Log    Found ${count} sticky navbar links

    FOR    ${index}    IN RANGE    ${count}
        # Re-fetch elements to avoid stale reference
        ${links}=    Get WebElements    ${NAV_LINKS}
        ${link}=     Set Variable       ${links}[${index}]

        ${text}=    Get Text    ${link}
        Log    Clicking sticky navbar link: ${text}

        Scroll Element Into View         ${link}
        Wait Until Element Is Visible    ${link}    10s
        Wait Until Element Is Enabled    ${link}    10s

        ${clicked}=    Run Keyword And Return Status    Click Element    ${link}
        IF    not ${clicked}
            Execute Javascript    arguments[0].click();    ${link}
        END

        Sleep    0.6s
    END

Test Narayanhiti Durbar
    Test Homestay
    Wait And Click    ${Narayanhiti}
    Wait Until Element Is Visible    ${Narayanhiti_content}
    Test Narayanhiti Navbar
    Scroll Element Into View    ${Narayanhiti_content}
    Click Home Menu
Test Kathmandu Durbar Navbar    
    [Documentation]    Click all section links inside sticky navbar (Intro → FAQS)

    ${NAVBAR}=     Set Variable    xpath=//nav[contains(@class,'sticky-navbar')]
    ${NAV_LINKS}=  Set Variable    xpath=//nav[contains(@class,'sticky-navbar')]//ul//li//a[contains(@class,'nav-link')]

    # Ensure sticky navbar is present
    Wait Until Element Is Visible    ${NAVBAR}    15s
    Scroll Element Into View         ${NAVBAR}
    Sleep    0.5s

    # Get all section links
    ${links}=    Get WebElements    ${NAV_LINKS}
    ${count}=    Get Length         ${links}
    Log    Found ${count} sticky navbar section links

    FOR    ${index}    IN RANGE    ${count}
        # Re-fetch to avoid stale element issues
        ${links}=    Get WebElements    ${NAV_LINKS}
        ${link}=     Set Variable       ${links}[${index}]

        ${text}=    Get Text    ${link}
        Log    Clicking section: ${text}

        Scroll Element Into View         ${link}
        Wait Until Element Is Visible    ${link}    10s
        Wait Until Element Is Enabled    ${link}    10s

        ${clicked}=    Run Keyword And Return Status    Click Element    ${link}
        IF    not ${clicked}
            Execute Javascript    arguments[0].click();    ${link}
        END

        Sleep    0.6s
    END


Test Kathmandu Durbar
    Test Homestay
    Wait And Click    ${KTM_Durbar}
    Wait Until Element Is Visible    ${KTM_Durbar_Content}
    Scroll Element Into View    xpath=/html/body/div[3]/nav
    Test Kathmandu Durbar Navbar
    Scroll Element Into View    ${KTM_Durbar Content}













