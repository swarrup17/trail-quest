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


Click All Everest Base Camp Sticky Navbar Sections
    [Documentation]    Scrolls to EBC sticky navbar <ul> and clicks all section links safely (CI + desktop)

    ${NAVBAR}=     Set Variable    //nav[contains(@class,'sticky-navbar')]
    ${NAV_LINKS}=  Set Variable    //nav[contains(@class,'sticky-navbar')]//ul//a[contains(@class,'nav-link')]

    # Ensure sticky navbar is present
    Wait Until Element Is Visible    xpath=${NAVBAR}    15s
    Scroll Element Into View         xpath=${NAVBAR}
    Sleep    0.5s

    # Get all sticky nav links
    ${links}=    Get WebElements    xpath=${NAV_LINKS}
    ${count}=    Get Length         ${links}
    Log    Found ${count} EBC sticky navbar links

    FOR    ${index}    IN RANGE    ${count}
        # Re-fetch links to avoid stale element issues
        ${links}=    Get WebElements    xpath=${NAV_LINKS}
        ${link}=     Set Variable       ${links}[${index}]

        ${text}=     Get Text    ${link}
        Log    Clicking sticky nav link: ${text}

        Scroll Element Into View    ${link}
        Sleep    0.4s

        Wait Until Element Is Visible    ${link}    10s
        Wait Until Element Is Enabled    ${link}    10s

        ${clicked}=    Run Keyword And Return Status    Click Element    ${link}

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
    Click All Everest Base Camp Sticky Navbar Sections

#CHALLENGING
Click Challenging
    Open Trek And Tours Menu
    Click Push Your Limit
    Go Down To
    Wait And Click    ${challenging}

Click All Mardi Sticky Navbar Sections
    [Documentation]    Clicks all section links inside sticky navbar <ul> (Intro → FAQS), CI + desktop safe

    # IMPORTANT: pure XPath only (no xpath= nesting)
    ${NAVBAR}=     Set Variable    //nav[contains(@class,'sticky-navbar')]
    ${NAV_LINKS}=  Set Variable    //nav[contains(@class,'sticky-navbar')]//ul//a[contains(@class,'nav-link')]

    # Ensure sticky navbar is visible
    Wait Until Element Is Visible    xpath=${NAVBAR}    15s
    Scroll Element Into View         xpath=${NAVBAR}
    Sleep    0.5s

    # Collect nav links
    ${links}=    Get WebElements    xpath=${NAV_LINKS}
    ${count}=    Get Length         ${links}
    Log    Found ${count} sticky navbar links

    FOR    ${index}    IN RANGE    ${count}
        # Re-fetch elements to avoid stale reference
        ${links}=    Get WebElements    xpath=${NAV_LINKS}
        ${link}=     Set Variable       ${links}[${index}]

        ${text}=     Get Text    ${link}
        Log    Clicking sticky navbar link: ${text}

        Scroll Element Into View    ${link}
        Sleep    0.4s

        Wait Until Element Is Visible    ${link}    10s
        Wait Until Element Is Enabled    ${link}    10s

        ${clicked}=    Run Keyword And Return Status    Click Element    ${link}

        # JS fallback (headless / CI)
        IF    not ${clicked}
            Log    JS click fallback for: ${text}
            Execute Javascript    arguments[0].click();    ${link}
        END

        Sleep    0.8s
        Run Keyword And Ignore Error    Capture Page Screenshot
    END
Test Mardi
    Click Challenging
    Wait And Click    ${mardi}
    Wait Until Element Is Visible    ${mardi_content}
    Click All Mardi Sticky Navbar Sections
    Scroll Element Into View    xpath=/html/body/div[3]/div/section[1]/div/div[1]/div[1]/h1

Click All langtang Sticky Navbar Sections
    [Documentation]    Clicks all section links inside sticky navbar <ul> (Intro → FAQS), CI + desktop safe

    ${NAVBAR}=     Set Variable    //nav[contains(@class,'sticky-navbar')]
    ${NAV_LINKS}=  Set Variable    //nav[contains(@class,'sticky-navbar')]//ul//a[contains(@class,'nav-link')]

    # Ensure sticky navbar is visible
    Wait Until Element Is Visible    xpath=${NAVBAR}    15s
    Scroll Element Into View         xpath=${NAVBAR}
    Sleep    0.5s

    # Collect all section links
    ${links}=    Get WebElements    xpath=${NAV_LINKS}
    ${count}=    Get Length         ${links}
    Log    Found ${count} sticky navbar section links

    FOR    ${index}    IN RANGE    ${count}
        # Re-fetch to avoid stale element reference
        ${links}=    Get WebElements    xpath=${NAV_LINKS}
        ${link}=     Set Variable       ${links}[${index}]

        ${text}=     Get Text    ${link}
        Log    Clicking section: ${text}

        Scroll Element Into View    ${link}
        Sleep    0.4s

        Wait Until Element Is Visible    ${link}    10s
        Wait Until Element Is Enabled    ${link}    10s

        ${clicked}=    Run Keyword And Return Status    Click Element    ${link}

        # JS fallback (headless / CI)
        IF    not ${clicked}
            Log    JS click fallback for: ${text}
            Execute Javascript    arguments[0].click();    ${link}
        END

        Sleep    0.8s
        Run Keyword And Ignore Error    Capture Page Screenshot
    END

Test Langtang
    Click Challenging
    Wait And Click   ${langtang}
    Wait Until Element Is Visible    ${langtang_content}
    Scroll Element Into View    xpath=/html/body/div[3]/nav
    Click All langtang Sticky Navbar Sections
    Scroll Element Into View    xpath=/html/body/div[3]/div[1]/section[1]/div/div[1]/div[1]/h1
Click All Poon Hill Navbar
    [Documentation]    Click all section links inside sticky navbar <ul> safely

    # Use pure XPath (Robot adds xpath= automatically)
    ${NAVBAR}      Set Variable    //nav[contains(@class,'sticky-navbar')]
    ${NAV_LINKS}   Set Variable    //nav[contains(@class,'sticky-navbar')]//ul/li/a[contains(@class,'nav-link')]

    # Wait for navbar
    Wait Until Element Is Visible    ${NAVBAR}    15s
    Scroll Element Into View         ${NAVBAR}
    Sleep    0.5s

    # Get all nav links
    ${links}=    Get WebElements    ${NAV_LINKS}
    ${count}=    Get Length         ${links}
    Log    Found ${count} sticky navbar links

    FOR    ${index}    IN RANGE    ${count}
        # Re-fetch to avoid stale element reference
        ${links}=    Get WebElements    ${NAV_LINKS}
        ${link}=     Set Variable       ${links}[${index}]

        ${text}=     Get Text    ${link}
        Log    Clicking navbar link: ${text}

        Scroll Element Into View    ${link}
        Sleep    0.3s

        Wait Until Element Is Visible    ${link}    10s
        Wait Until Element Is Enabled    ${link}    10s

        ${clicked}=    Run Keyword And Return Status    Click Element    ${link}

        IF    not ${clicked}
            Log    JS click fallback for: ${text}
            Execute Javascript    arguments[0].click();    ${link}
        END

        Sleep    0.6s
        Run Keyword And Ignore Error    Capture Page Screenshot
    END
Test Poon Hill
    Click Challenging
    Wait And Click    ${poon_hill}
    Wait Until Element Is Visible    ${poon_hill_content}
    Scroll Element Into View    xpath=/html/body/div[3]/nav
    Click All Poon Hill Navbar
    Scroll Element Into View    xpath=/html/body/div[3]/div[1]/section[1]/div/div[1]/div[1]/h1
Click All Amayangri Navbar
     [Documentation]    Clicks all <a class="nav-link"> inside sticky navbar <ul>

    ${NAVBAR}     Set Variable    //nav[contains(@class,'sticky-navbar')]
    ${NAV_LINKS}  Set Variable    //nav[contains(@class,'sticky-navbar')]//ul/li/a[contains(@class,'nav-link')]

    # Wait for navbar
    Wait Until Element Is Visible    ${NAVBAR}    15s
    Scroll Element Into View         ${NAVBAR}
    Sleep    0.5s

    # Fetch all links
    ${links}=    Get WebElements    ${NAV_LINKS}
    ${count}=    Get Length         ${links}
    Log    Found ${count} sticky navbar links

    FOR    ${index}    IN RANGE    ${count}
        # Re-fetch to avoid stale element issue
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
            Log    JS click fallback for: ${text}
            Execute Javascript    arguments[0].click();    ${link}
        END

        Sleep    0.6s
        Run Keyword And Ignore Error    Capture Page Screenshot
    END
Test Amayangri
    Click Challenging
    Wait And Click    ${amayangri}
    Wait Until Element Is Visible    ${amayangri_content}
    Scroll Element Into View    xpath=/html/body/div[3]/nav
    Click All Amayangri Navbar
    Scroll Element Into View    ${amayangri_content}




