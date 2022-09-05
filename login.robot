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