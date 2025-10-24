*** Settings ***

Resource    ../../Resources/utils/browser.resource
Resource    ../../Resources/pages/authentication_page.resource
Resource    ../../Resources/pages/bank_statement_page.resource

Test Setup  Abrir Browser
Test Teardown  Close All Browsers

*** Test Cases ***

Criação de conta sem saldo
    [Documentation]    Teste para validar a criação e conta sem saldo
    [Tags]    Extrato    Saldo
    Realizar novo cadastro    balance=${False}
    Realizar login
    Conferir conta criada sem saldo
    Realizar logout

Criação de conta com saldo
    [Documentation]    Teste para validar a criação e conta sem saldo
    [Tags]    Extrato    Saldo
    Realizar novo cadastro    balance=${True}
    Realizar login
    Conferir conta criada com saldo
    Realizar logout