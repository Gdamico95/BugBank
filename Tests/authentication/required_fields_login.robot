*** Settings ***
Resource    ../../Resources/utils/browser.resource
Resource    ../../Resources/pages/authentication_page.resource

Test Setup  Abrir Browser
Test Teardown  Close All Browsers

*** Test Cases ***

Validar campos obrigatórios para login
    [Documentation]    Teste para validar os campos obrigatórios no momento do login
    Tentar fazer login sem preencher nenhum campo