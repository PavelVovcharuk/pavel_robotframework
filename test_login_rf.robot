*** Settings ***
Library             SeleniumLibrary

Documentation       Suite description #automated tests for scout website
*** Variables ***
${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en
${BROWSER}          Chrome
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}    xpath=//*[@id='password']
${SIGNINBUTTON}     xpath=//*[text()= 'Sign in']
${PAGELOGO}    xpath=//*[@id='__next']/div[1]/main/div[3]/div[1]/div/div[1]

*** Test Cases ***
Login to the system
    [Tags]    Debug
    Open login page
    Type in email
    Type in password
    Click on the submit button
    Assert Dashboard
    [Teardown]    Close Browser


*** Keywords ***
Open login page
    Open Browser                   ${LOGIN URL}    ${BROWSER}
    Title Should Be                Scouts panel - sign in
Type in email
    Input Text                     ${EMAILINPUT}     user10@getnada.com
Type in password
    Input Text                     ${PASSWORDINPUT}  Test-1234
Click on the submit button
    Click Element                  ${SIGNINBUTTON}
Assert Dashboard
    Wait Until Element Is Visible  ${PAGELOGO}
    Title Should Be                Scouts panel
    Capture Page Screenshot        alert.png
