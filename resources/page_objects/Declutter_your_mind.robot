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
Test Declutter Your Mind
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
    Test Declutter Your Mind
    Wait And Click    ${The_Annapurna_Reset}
    Wait Until Element Is Visible    ${The_Annapurna_Content}
    Scroll Element Into View    xpath=/html/body/div[3]/div/nav
    Test The Annapurna Reset Navbar
    Scroll Element Into View    ${The_Annapurna_Content}

