***Settings***
Library     Browser
Resource    ../Login/task.resource

*** Test Cases ***
Valid Login
    [Documentation]    To verify valid login with correct credentials
    Open Browser To Login Page    https://www.saucedemo.com/v1/
    Input Credentials    ${username}    ${password}
    Click Login Button
    Verify Successful Login