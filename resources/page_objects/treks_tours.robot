*** Settings ***
Library    Collections
Resource    ../common/browser.robot
Resource    ../common/keywords.robot
Resource    ../locators/home_page_locators.robot
Resource    home_page.robot

*** Keywords ***
Go Down to
    Scroll Element Into View    ${header}
    Sleep    2s

Click Easy
    Wait And Click    ${easy}
Click Everest Picture
    Wait And Click    ${everest_picture}
    Wait Until Element Is Visible    ${everest_header}

Click All Everest Sticky Navbar Links
    Scroll Element Into View    ${nav_bar}
    ${section}=    Get WebElement    xpath=//*[@data-section='nav-intro']
    ${nav_links}=    Get WebElements    xpath=//nav[contains(@class,'sticky-navbar')][1]//ul/li/a[contains(@class,'nav-link')]

    FOR    ${link}    IN    @{nav_links}
        ${link_text}=    Get Text    ${link}
        Log    Clicking navbar link: ${link_text}

        Scroll Element Into View    ${link}
        Sleep    0.5s

        Click Element    ${link}
        Sleep    1s

        Capture Page Screenshot
    END

# Window Switching Keywords
Handle Share Button Click
    [Arguments]    ${share_button_locator}
    [Documentation]    Clicks share button and switches to new window/tab

    # Get current window handle
    ${main_window}=    Get Window Handles
    ${main_window}=    Get From List    ${main_window}    0

    # Scroll to element and wait for it to be clickable
    Scroll Element Into View    ${share_button_locator}
    Sleep    1s
    Wait Until Element Is Visible    ${share_button_locator}    timeout=10s

    # Try multiple click methods
    ${status}=    Run Keyword And Return Status    Click Element    ${share_button_locator}
    Run Keyword Unless    ${status}    Click Element Using JavaScript    ${share_button_locator}

    # Wait for new window to open
    Sleep    3s

    # Get all window handles
    ${all_windows}=    Get Window Handles
    ${window_count}=    Get Length    ${all_windows}

    # If new window opened, switch to it
    Run Keyword If    ${window_count} > 1    Switch To New Window    ${all_windows}

    [Return]    ${main_window}

Click Element Using JavaScript
    [Arguments]    ${locator}
    [Documentation]    Clicks element using JavaScript when normal click fails
    Execute JavaScript    arguments[0].click();    ARGUMENTS    ${locator}

Switch To New Window
    [Arguments]    ${all_windows}
    [Documentation]    Switches to the newest window

    ${new_window}=    Get From List    ${all_windows}    -1
    Switch Window    ${new_window}
    Log    Switched to new window

Close Share Window And Return
    [Arguments]    ${main_window}
    [Documentation]    Closes current window and returns to main

    # Get current windows
    ${all_windows}=    Get Window Handles
    ${window_count}=    Get Length    ${all_windows}

    # If there's more than one window, close current and switch back
    Run Keyword If    ${window_count} > 1    Close Window
    Switch Window    ${main_window}
    Log    Returned to main window

Test The Push Your Limit
    Verify Logo Is Visible
    Open Trek And Tours Menu
    Click Push Your Limit
    Go Down To
    Click Easy
    Click Everest Picture
    Click All Everest Sticky Navbar Links

    # Scroll to share section before clicking
    Scroll Element Into View    ${share}
    Sleep    1s

    # Test Facebook Share
    Wait And Click    ${share}
    Sleep    2s
    Wait Until Element Is Visible    ${facebook}
    Sleep    1s
    ${main}=    Handle Share Button Click    ${facebook}
    Sleep    3s
    Capture Page Screenshot    facebook_popup.png
    Close Share Window And Return    ${main}
    Log    Facebook share tested successfully

    # Scroll to share section again
    Scroll Element Into View    ${share}
    Sleep    1s

    # Test Twitter Share
    Wait And Click    ${share}
    Sleep    2s
    Wait Until Element Is Visible    ${twitter}
    Sleep    1s
    ${main}=    Handle Share Button Click    ${twitter}
    Sleep    3s
    Capture Page Screenshot    twitter_popup.png
    Close Share Window And Return    ${main}
    Log    Twitter share tested successfully
#
#Test Facebook
#    Verify Logo Is Visible
#    Open Trek And Tours Menu
#    Click Push Your Limit
#    Go Down To
#    Click Easy
#    Click Everest Picture
#
#    Wait And Click    ${share}
#    Sleep    2s
#    Wait Until Element Is Visible    ${facebook}
#    ${main}=    Handle Share Button Click    ${facebook}
#    Sleep    3s
#    Capture Page Screenshot    facebook_share.png
#    Close Share Window And Return    ${main}
#    Log    Facebook test completed
#
#Test Twitter
#    Verify Logo Is Visible
#    Open Trek And Tours Menu
#    Click Push Your Limit
#    Go Down To
#    Click Easy
#    Click Everest Picture
#
#    Wait And Click    ${share}
#    Sleep    2s
#    Wait Until Element Is Visible    ${twitter}
#    ${main}=    Handle Share Button Click    ${twitter}
#    Sleep    3s
#    Capture Page Screenshot    twitter_share.png
#    Close Share Window And Return    ${main}
#    Log    Twitter test completed

Click All Kanchenjunga Sticky Navbar Links
    ${nav_bar}=    Get WebElement    xpath=//nav[contains(@class,'sticky-navbar')]
    Scroll Element Into View    ${nav_bar}
    Sleep    0.5s

    ${nav_links}=    Get WebElements    xpath=//nav[contains(@class,'sticky-navbar')]//ul/li/a[contains(@class,'nav-link')]

    FOR    ${link}    IN    @{nav_links}
        ${link_text}=    Get Text    ${link}
        Log    Clicking navbar link: ${link_text}

        Scroll Element Into View    ${link}
        Sleep    0.5s

        Run Keyword And Ignore Error    Click Element    ${link}
        Sleep    1s

        Run Keyword And Ignore Error    Capture Page Screenshot
    END

Test KanchenjungaTrek
    Wait And Click    xpath=/html/body/div[1]/header/div[1]/div/div/div/a/img[1]
    Open Trek And Tours Menu
    Wait And Click    ${push_your_limit}
    Go Down To
    Wait And Click    ${kanchenjunga_image}
    Wait Until Element Is Visible    ${kan_ele}
    Scroll Element Into View    ${kan_header}
    Click All Kanchenjunga Sticky Navbar Links

Click All gokyo Sticky Navbar Links
    ${nav_bar}=    Get WebElement    xpath=//nav[contains(@class,'sticky-navbar')]
    Scroll Element Into View    ${nav_bar}
    Sleep    0.5s

    ${nav_links}=    Get WebElements    xpath=//nav[contains(@class,'sticky-navbar')]//ul/li/a[contains(@class,'nav-link')]

    FOR    ${link}    IN    @{nav_links}
        ${link_text}=    Get Text    ${link}
        Log    Clicking navbar link: ${link_text}

        Scroll Element Into View    ${link}
        Sleep    1s

        Wait Until Element Is Visible    ${link}    timeout=5s
        Run Keyword And Ignore Error    Click Element    ${link}
        Sleep    1s

        Run Keyword And Ignore Error    Capture Page Screenshot
    END

Test Everest Via Gokyo_Trek
    Scroll Element Into View    xpath=/html/body/div[1]/header/div[1]/div/div/div
    Wait And Click    xpath=/html/body/div[1]/header/div[1]/div/div/div/a/img[1]
    Open Trek And Tours Menu
    Click Push Your Limit
    Go Down To
    Wait And Click    ${eve_go_but}
    Wait Until Element Is Visible    ${gokyo_element}
    Scroll Element Into View    ${gokyo_header}
    Click All gokyo Sticky Navbar Links

#Moderate
Click Moderate
    Open Trek And Tours Menu
    Click Push Your Limit
    Go Down To
    Wait And Click    ${moderate}


Click All Annapurna Sticky Navbar Links
    [Documentation]    Scrolls to sticky navbar and clicks all nav links, takes screenshots, safe for CI
    ${nav_bar}=    Get WebElement    xpath=//nav[contains(@class,'sticky-navbar')]
    Scroll Element Into View    ${nav_bar}
    Sleep    0.5s

    ${nav_links}=    Get WebElements    xpath=//nav[contains(@class,'sticky-navbar')]//ul/li/a[contains(@class,'nav-link')]

    FOR    ${link}    IN    @{nav_links}
        ${link_text}=    Get Text    ${link}
        Log    Clicking navbar link: ${link_text}

        Scroll Element Into View    ${link}
        Sleep    0.5s

        # Wait until clickable
        Wait Until Element Is Visible    ${link}    timeout=5s
        Wait Until Element Is Enabled    ${link}    timeout=5s

        # Try normal click
        ${clicked}=    Run Keyword And Return Status    Click Element    ${link}

        # Fallback to JS click if normal click fails
        IF    not ${clicked}
            Log    Using JS click fallback for ${link_text}
            Execute Javascript
            ...    arguments[0].click();
            ...    ${link}
        END

        Sleep    1s
        Run Keyword And Ignore Error    Capture Page Screenshot
    END

#Annapurna Circuit Trek
Test Annapurna Circuit Trek
    Click Moderate
    Wait And Click    ${annapurna_circuit}
    Wait Until Element Is Visible    xpath=/html/body/div[3]/div/section[1]/div/div[1]
    Click All Annapurna Sticky Navbar Links
    Scroll Element Into View    xpath=/html/body/div[1]/header

Click All Manaslu Sticky Navbar Links
    [Documentation]    Scrolls to Manaslu sticky navbar and clicks all nav links safely (desktop + CI)
    ${NAVBAR}=    Set Variable    xpath=//nav[contains(@class,'sticky-navbar')]
    ${NAV_LINKS}=    Set Variable    xpath=//nav[contains(@class,'sticky-navbar')]//a[contains(@class,'nav-link')]

    # Ensure navbar exists
    Wait Until Element Is Visible    ${NAVBAR}    15s
    Scroll Element Into View         ${NAVBAR}
    Sleep    0.5s

    # Collect all links
    ${links}=    Get WebElements    ${NAV_LINKS}
    ${count}=    Get Length    ${links}
    Log    Found ${count} sticky navbar links

    FOR    ${index}    IN RANGE    ${count}
        # Re-fetch elements to avoid stale element issues
        ${links}=    Get WebElements    ${NAV_LINKS}
        ${link}=     Set Variable       ${links}[${index}]

        ${text}=     Get Text    ${link}
        Log    Clicking sticky nav link: ${text}

        Scroll Element Into View    ${link}
        Sleep    0.5s

        # Explicit waits (important for CI)
        Wait Until Element Is Visible    ${link}    10s
        Wait Until Element Is Enabled    ${link}    10s

        # Normal click attempt
        ${clicked}=    Run Keyword And Return Status    Click Element    ${link}

        # JS fallback for CI / headless failures
        IF    not ${clicked}
            Log    JS click fallback for: ${text}
            Execute Javascript    arguments[0].click();    ${link}
        END

        Sleep    1s
        Run Keyword And Ignore Error    Capture Page Screenshot
    END


Test Manaslu Circuit Trek
    Click Moderate
    Wait And Click    ${manaslu_circuit}
    Wait Until Element Is Visible    ${manaslu_content}
    Click All Manaslu Sticky Navbar Links
    Scroll Element Into View    xpath=/html/body/div[1]/header/div[1]/div/div/div/div/div[2]/div[2]

Click All Annapurna Base Camp Sticky Navbar Link
    [Documentation]    Scrolls to ABC sticky navbar and clicks all section links safely (CI + desktop)

    ${NAVBAR}=     Set Variable    xpath=//nav[contains(@class,'sticky-navbar')]
    ${NAV_LINKS}=  Set Variable    xpath=//nav[contains(@class,'sticky-navbar')]//ul//a[contains(@class,'nav-link')]

    # Ensure navbar is present
    Wait Until Element Is Visible    ${NAVBAR}    15s
    Scroll Element Into View         ${NAVBAR}
    Sleep    0.5s

    # Get all sticky nav links
    ${links}=    Get WebElements    ${NAV_LINKS}
    ${count}=    Get Length         ${links}
    Log    Found ${count} ABC sticky navbar links

    FOR    ${index}    IN RANGE    ${count}
        # Re-fetch links to avoid stale element exception
        ${links}=    Get WebElements    ${NAV_LINKS}
        ${link}=     Set Variable       ${links}[${index}]

        ${text}=     Get Text    ${link}
        Log    Clicking sticky nav link: ${text}

        Scroll Element Into View    ${link}
        Sleep    0.4s

        # Explicit waits (important for CI)
        Wait Until Element Is Visible    ${link}    10s
        Wait Until Element Is Enabled    ${link}    10s

        # Try normal click
        ${clicked}=    Run Keyword And Return Status    Click Element    ${link}

        # JS click fallback for headless / CI failures
        IF    not ${clicked}
            Log    JS click fallback for: ${text}
            Execute Javascript    arguments[0].click();    ${link}
        END

        Sleep    0.8s
        Run Keyword And Ignore Error    Capture Page Screenshot
    END

Test Annapurna Base Camp
    Click Moderate
    Wait And Click    ${Annapurna_base_camp}
    Wait Until Element Is Visible    ${Annapurna_base_content}
    Click All Annapurna Base Camp Sticky Navbar Link
    Scroll Element Into View    xpath=/html/body/div[1]/header/div[1]/div/div/div


Click All Everest Base Camp Sticky Navbar Link
    [Documentation]    Scrolls to ABC sticky navbar <ul> and clicks all section links safely (CI + desktop)

    ${NAV_UL}=      Set Variable    xpath=//nav[contains(@class,'sticky-navbar')]//ul
    ${NAV_LINKS}=   Set Variable    xpath=//nav[contains(@class,'sticky-navbar')]//ul//a[contains(@class,'nav-link')]

    # Ensure sticky navbar UL is present
    Wait Until Element Is Visible    ${NAV_UL}    15s
    Scroll Element Into View         ${NAV_UL}
    Sleep    0.5s

    # Collect all section links (Intro → FAQS)
    ${links}=    Get WebElements    ${NAV_LINKS}
    ${count}=    Get Length         ${links}
    Log    Found ${count} ABC sticky navbar links

    FOR    ${index}    IN RANGE    ${count}
        # Re-fetch to avoid stale element issues
        ${links}=    Get WebElements    ${NAV_LINKS}
        ${link}=     Set Variable       ${links}[${index}]

        ${text}=     Get Text    ${link}
        Log    Clicking sticky nav link: ${text}

        Scroll Element Into View    ${link}
        Sleep    0.4s

        # Explicit waits (important for CI)
        Wait Until Element Is Visible    ${link}    10s
        Wait Until Element Is Enabled    ${link}    10s

        # Normal click attempt
        ${clicked}=    Run Keyword And Return Status    Click Element    ${link}

        # JS fallback for headless / CI failures
        IF    not ${clicked}
            Log    JS click fallback for: ${text}
            Execute Javascript    arguments[0].click();    ${link}
        END

        Sleep    0.8s
        Run Keyword And Ignore Error    Capture Page Screenshot
    END

Test Everest Base Camp
    Click Moderate
    Wait And Click    ${Everest_base_camp}
    Wait Until Element Is Visible    ${EBC_content}
    Click All Everest Base Camp Sticky Navbar Link











