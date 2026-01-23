*** Settings ***
Library    Collections
Resource    ../common/browser.robot
Resource    ../common/keywords.robot
Resource    ../locators/home_page_locators.robot
Resource    home_page.robot
Resource    treks_tours.robot

*** Keywords ***
Click Declutter Your Mind
    Wait And Click    ${Declutter_your_mind}
    Sleep    2s
#Indoor Retreats
Test Indoor Retrests
    Click Declutter Your Mind
    Wait Until Element Is Visible    ${Declutter_content}
    Go Down To
    Wait And Click    ${Indoor_Retreats}
    Sleep    2s
    Scroll Element Into View    xpath=//*[@id="tab-indoor-retreats"]/section/div/div/div/div[2]
    Wait Until Element Is Visible    xpath=//*[@id="tab-indoor-retreats"]/section/div/div/div/div[2]
    Sleep    1s

Test The Annapurna Reset Navbar
    [Documentation]    Click all section links inside sticky navbar (Intro → FAQS)

    ${NAVBAR}     Set Variable    //nav[contains(@class,'sticky-navbar')]
    ${NAV_LINKS}  Set Variable    //nav[contains(@class,'sticky-navbar')]//ul/li/a[contains(@class,'nav-link')]

    Wait Until Element Is Visible    ${NAVBAR}    15s
    Scroll Element Into View         ${NAVBAR}

    ${links}=    Get WebElements    ${NAV_LINKS}
    ${count}=    Get Length         ${links}

    FOR    ${i}    IN RANGE    ${count}
        ${links}=    Get WebElements    ${NAV_LINKS}
        ${link}=     Set Variable       ${links}[${i}]

        Scroll Element Into View    ${link}
        Wait Until Element Is Visible    ${link}    10s

        ${clicked}=    Run Keyword And Return Status    Click Element    ${link}
        IF    not ${clicked}
            Execute Javascript    arguments[0].click();    ${link}
        END
    END
Test The Annapurna Reset
    Test Indoor Retrests
    Wait And Click    ${The_Annapurna_Reset}
    Wait Until Element Is Visible    ${The_Annapurna_Content}
    Scroll Element Into View    xpath=/html/body/div[3]/div/nav
    Test The Annapurna Reset Navbar
    Scroll Element Into View    ${The_Annapurna_Content}
Test The Mardi Path Navbar
    [Documentation]    Click all section links inside sticky navbar (Intro → FAQS)

    ${NAVBAR}=     Set Variable    xpath=//nav[contains(@class,'sticky-navbar')]
    ${NAV_LINKS}=  Set Variable    xpath=//nav[contains(@class,'sticky-navbar')]//ul/li/a[contains(@class,'nav-link')]

    # Ensure sticky navbar is visible
    Wait Until Element Is Visible    ${NAVBAR}    15s
    Scroll Element Into View         ${NAVBAR}
    Sleep    0.5s

    # Collect all section links
    ${links}=    Get WebElements    ${NAV_LINKS}
    ${count}=    Get Length         ${links}
    Log    Found ${count} sticky navbar links

    FOR    ${i}    IN RANGE    ${count}
        # Re-fetch to avoid stale elements
        ${links}=    Get WebElements    ${NAV_LINKS}
        ${link}=     Set Variable       ${links}[${i}]

        ${text}=     Get Text    ${link}
        Log    Clicking sticky navbar link: ${text}

        Scroll Element Into View        ${link}
        Wait Until Element Is Visible  ${link}    10s
        Wait Until Element Is Enabled  ${link}    10s

        ${clicked}=    Run Keyword And Return Status    Click Element    ${link}
        IF    not ${clicked}
            Execute Javascript    arguments[0].click();    ${link}
        END

        Sleep    0.6s
    END
Test The Mardi Path
    Open Trek And Tours Menu
    Test Indoor Retrests
    Wait And Click    ${The_mardi_path}
    Wait Until Element Is Visible    ${The_mardi_path_content}
    Scroll Element Into View    xpath=/html/body/div[3]/nav
    Test The Mardi Path Navbar
    Scroll Element Into View    ${The_mardi_path_content}
Test The Khopra Reset Navbar
    [Documentation]    Click all section links inside sticky navbar (Intro → FAQS)

    ${NAVBAR}=     Set Variable    xpath=//nav[contains(@class,'sticky-navbar')]
    ${NAV_LINKS}=  Set Variable    xpath=//nav[contains(@class,'sticky-navbar')]//ul/li/a[contains(@class,'nav-link')]

    # Ensure sticky navbar is visible
    Wait Until Element Is Visible    ${NAVBAR}    15s
    Scroll Element Into View         ${NAVBAR}
    Sleep    0.5s

    # Get all section links (Intro → FAQS)
    ${links}=    Get WebElements    ${NAV_LINKS}
    ${count}=    Get Length         ${links}
    Log    Found ${count} sticky navbar section links

    FOR    ${i}    IN RANGE    ${count}
        # Re-fetch elements to avoid stale element issues
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

Test The Khopra Reset
    Open Trek And Tours Menu
    Test Indoor Retrests
    Wait And Click    ${The_khopra_reset}
    Wait Until Element Is Visible    ${The_khopra_reset_content}
    Scroll Element Into View    xpath=/html/body/div[3]/nav
    Test The Khopra Reset Navbar
    Scroll Element Into View    ${The_khopra_reset_content}

#Outdoor Retreats
Test Outdoor Retreats
    Click Declutter Your Mind
    Wait Until Element Is Visible    ${Declutter_content}
    Go Down To
    Wait And Click    ${Outdoor_Retreats}
    Sleep    2s
    Scroll Element Into View    xpath=//*[@id="tab-outdoor-retreats"]/section/div/div/div/div[2]/div
    Wait Until Element Is Visible    xpath=//*[@id="tab-outdoor-retreats"]/section/div/div/div/div[2]/div
    Sleep    1s
Test The Ghandruk Reset Navbar
    [Documentation]    Click all section links inside sticky navbar (Intro → FAQS)

    ${NAVBAR}=     Set Variable    xpath=//nav[contains(@class,'sticky-navbar')]
    ${NAV_LINKS}=  Set Variable    xpath=//nav[contains(@class,'sticky-navbar')]//ul/li/a[contains(@class,'nav-link')]

    # Ensure navbar is present and visible
    Wait Until Element Is Visible    ${NAVBAR}    15s
    Scroll Element Into View         ${NAVBAR}
    Sleep    0.5s

    # Collect all section links
    ${links}=    Get WebElements    ${NAV_LINKS}
    ${count}=    Get Length         ${links}
    Log    Found ${count} sticky navbar links

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

Test Ghandruk Reset
    Open Trek And Tours Menu
    Test Outdoor Retreats
    Wait And Click    ${The_Ghandruk_Reset}
    Wait Until Element Is Visible    ${The_Ghandruk_Reset_Contents}
    Scroll Element Into View    xpath=/html/body/div[3]/nav
    Test The Ghandruk Reset Navbar
    Scroll Element Into View    ${The_Ghandruk_Reset_Contents}


