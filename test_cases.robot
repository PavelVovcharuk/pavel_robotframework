*** Settings ***
Library             SeleniumLibrary
Library             Collections

Documentation       Suite description #automated tests for scout website
Test Setup          Run Keywords    Open login page    Log in to system    Click On The Add Player Button
Test Teardown       Close Browser

*** Variables ***
${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en
${BROWSER}          Chrome
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}    xpath=//*[@id='password']
${SIGNINBUTTON}     xpath=//*[text()= 'Sign in']
${PAGELOGO}         xpath=//*[@id='__next']/div[1]/main/div[3]/div[1]/div/div[1]
${ADDPLAYERBUTTON}  xpath=//*[@id="__next"]/div[1]/main/div[3]/div[2]/div/div/a
${NAMEINPUT}        xpath=//input[@name='name']
${SURNAMEINPUT}     xpath=//input[@name='surname']
${POSITIONINPUT}    xpath=//input[@name='mainPosition']
${AGEINPUT}         xpath=//input[@name='age']
${SUBMITBUTTON}     xpath=//button[@type='submit']
${LANGUAGEBUTTON}   xpath=//*[@id='__next']/div[1]/div/div/div/ul[2]/div[1]
${SIGNOUTBUTTON}    xpath=//ul[2]/div[@role='button'][2]
${ADDEMAILINPUT}    xpath=//input[@name='email']

*** Test Cases ***

Adding new player with requiered fields
    [Tags]    Positive
    Type In Name
    Type In Surname
    Type In Age
    Type In Position
    Click On The Submit Button
    Assert Stay At Add Page
    Assert Test Case 1

Adding new player with invalid email
    [Tags]    Negative
    Type In Name
    Type In Surname
    Type In Age
    Type In Position
    Type In Addemail
    Click On The Submit Button
    Assert Stay At Add Page
    Assert Test Case 2

Adding new player with empty fields
    [Tags]    Negative
    Click On The Submit Button
    Assert Test Case 3

Changing the language
    [Tags]    Positive
    Click On The Language Button
    Assert Test Case 4

Logging out of the system
    [Tags]    Positive
    Click On The Signout Button
    Assert Test Case 5

*** Keywords ***
Click on the add player button
    Click Element                  ${ADDPLAYERBUTTON}
Click on the submit button
    Click Element                  ${SUBMITBUTTON}
Click on the language button
    Click Element                  ${LANGUAGEBUTTON}
Click on the signout button
    Click Element                  ${SIGNOUTBUTTON}
Type in name
    Input Text                     ${NAMEINPUT}       Name
Type in surname
    Input Text                     ${SURNAMEINPUT}    Surname
Type in age
    Input Text                     ${AGEINPUT}        15062000
Type in position
    Input Text                     ${POSITIONINPUT}   Random
Type in addemail
    Input Text                     ${ADDEMAILINPUT}      $%(?/{[
Assert Dashboard
    Wait Until Element Is Visible  ${PAGELOGO}
    Title Should Be                Scouts panel
    Capture Page Screenshot        alert.png
Open login page
    Open Browser                   ${LOGIN URL}    ${BROWSER}
    Title Should Be                Scouts panel - sign in
Log in to system
    Input Text                     ${EMAILINPUT}     user10@getnada.com
    Input Text                     ${PASSWORDINPUT}  Test-1234
    Click Element                  ${SIGNINBUTTON}
    Wait Until Element Is Visible  ${PAGELOGO}
    Title Should Be                Scouts panel
Assert test case 1
    Sleep  5s
    Capture Page Screenshot        testcase1.png
Assert test case 2
    Sleep  5s
    Capture Page Screenshot        testcase2.png
Assert test case 3
    Sleep  5s
    Capture Page Screenshot        testcase3.png
Assert test case 4
    Sleep  5s
    Capture Page Screenshot        testcase4.png
Assert test case 5
    Sleep  5s
    Capture Page Screenshot        testcase5.png
Assert Stay At Add Page
    Titles should be        Add player


