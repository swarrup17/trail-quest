*** Settings ***
Library    SeleniumLibrary
Library    String
*** Keywords ***
Wait And Click
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}
    Click Element    ${locator}

Wait And Input Text
    [Arguments]    ${locator}    ${text}
    Wait Until Element Is Visible    ${locator}
    Input Text    ${locator}    ${text}

Verify Page Contains
    [Arguments]    ${text}
    Page Should Contain    ${text}


Wait And Click Safely
    [Arguments]    ${locator}    ${timeout}=15s

    Wait Until Element Is Visible    ${locator}    ${timeout}
    Wait Until Element Is Enabled    ${locator}    ${timeout}
    Scroll Element Into View         ${locator}

    ${clicked}=    Run Keyword And Return Status
    ...    Click Element    ${locator}

    IF    not ${clicked}
        Log    Normal click failed, using JS click
        Execute Javascript
        ...    arguments[0].click();
        ...    document.evaluate("${locator.replace('xpath=','')}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
    END
