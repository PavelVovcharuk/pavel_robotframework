*** Settings ***
Library             SeleniumLibrary

Documentation       Suite description #automated tests for scout website
*** Variables ***
${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en
${BROWSER}          Chrome
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}    xpath=//*[@id='password']
${SIGNINBUTTON}     xpath=//*[text()= 'Sign in']
${PAGELOGO}         xpath=//*[@id='__next']/div[1]/main/div[3]/div[1]/div/div[1]
${ADDPLAYERBUTTON}  xpath=//main/div[count(div) = 3]/div[2]//a
${NAMEINPUT}        xpath=//input[@name='name']
${SURNAMEINPUT}     xpath=//input[@name='surname']
${POSITIONINPUT}    xpath=//input[@name='mainPosition']
${AGEINPUT}         xpath=//input[@name='age']
${SUBMITBUTTON}     xpath=//button[@type='submit']
${LANGUAGEBUTTON}   xpath=//*[@id='__next']/div[1]/div/div/div/ul[2]/div[1]
${SIGNOUTBUTTON}    xpath=//*[text()= 'Sign out']
${ADDEMAILINPUT}    xpath=//input[@name='email']

*** Test Cases ***

Adding new player with requiered fields
    Open login page
    Type in email
    Type in password
    Click On The Signin Button
    Assert Dashboard
    Click On The Add Player Button
    Type In Name
    Type In Surname
    Type In Age
    Type In Position
    Click On The Submit Button
    [Teardown]    Close Browser

Adding new player with invalid email
    Open login page
    Type in email
    Type in password
    Click On The Signin Button
    Click On The Players Button
    Click On The Add Player Button
    Type In Name
    Type In Surname
    Type In Age
    Type In Position
    Type In Addemail
    Click On The Submit Button
    [Teardown]    Close Browser

Adding new player with empty fields
    Open login page
    Type in email
    Type in password
    Click On The Signin Button
    Click On The Add Player Button
    Click On The Submit Button
    [Teardown]    Close Browser

Changing the language
    Open login page
    Type in email
    Type in password
    Click On The Signin Button
    Click On The Language Button
    [Teardown]    Close Browser

Logging out of the system
    Open login page
    Type in email
    Type in password
    Click On The Signin Button
    Click On The Signout Button
    [Teardown]    Close Browser

*** Keywords ***
Open login page
    Open Browser                   ${LOGIN URL}    ${BROWSER}
    Title Should Be                Scouts panel - sign in
Type in email
    Input Text                     ${EMAILINPUT}     user10@getnada.com
Type in password
    Input Text                     ${PASSWORDINPUT}  Test-1234
Click on the signin button
    Click Element                  ${SIGNINBUTTON}
Click on the players button
    Click Element                  ${PLAYERSBUTTON}
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









