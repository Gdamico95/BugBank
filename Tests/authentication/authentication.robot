*** Settings ***
Resource    ../../Resource/pages/authentication_page.resource

Test Setup  Abrir Browser
Test Teardown  Close All Browsers

*** Test Cases ***

Login
    Realizar login