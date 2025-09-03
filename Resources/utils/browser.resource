*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Abrir Browser
    Open Browser
    ...  url=https://bugbank.netlify.app/
    ...  browser=chrome
    Maximize Browser Window