*** Settings ***
Library  SeleniumLibrary
Resource  ../Resource/data/login_data.yml
Resource  ../locators/authentication_locators.yml

*** Keywords ***
Realizar login
    Wait Until Element Is Visible    ${inputEmail}
    Input Text  ${inputEmail}  ${user}
    Input Text  ${inputPassword}  ${password}
    Click Button  ${buttonAccess}