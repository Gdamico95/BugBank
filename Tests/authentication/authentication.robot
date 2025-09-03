*** Settings ***
Resource    ../../Resources/utils/browser.resource
Resource    ../../Resources/pages/authentication_page.resource

Test Setup  Abrir Browser
Test Teardown  Close All Browsers

*** Test Cases ***

Cadastro e Login
    [Documentation]    Teste para validar a realização de um novo cadastro e do login com uma conta recém cadastrada
    [Tags]    Cadastro    Login
    Realizar novo cadastro
    Realizar login
    Validar informações da conta
    Realizar logout