*** Settings ***
Library    Browser
Variables    ../Login/page.py
Variables    ../Products/page.py

*** Keywords ***
Open Browser To Login Page
    [Arguments]    ${url}
    New Browser    chromium    headless=true
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page       ${url}

Input Credentials
    [Arguments]    ${username}    ${password}
    Wait For Elements State    ${username_field}    visible    timeout=10s
    Fill Text    ${username_field}    ${username}
    Wait For Elements State    ${password_field}    visible    timeout=10s
    Fill Text    ${password_field}    ${password}

Click Login Button
    Wait For Elements State    ${login_button}    visible    timeout=10s
    Click    ${login_button}

Verify Successful Login
    Wait For Elements State    ${products_header}    visible    timeout=10s
    ${text}=    Get Text    ${products_header}
    Should Be Equal    ${text}    Products