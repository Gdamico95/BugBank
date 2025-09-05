*** Settings ***
Resource    ../../Resources/utils/browser.resource
Resource    ../../Resources/pages/authentication_page.resource

Test Setup  Abrir Browser
Test Teardown  Close All Browsers

*** Test Cases ***

Validar campos obrigatórios para se registrar
    [Documentation]    Teste para validar os campos obrigatórios no momento do registro
    Tentar se registrar sem preencher nenhum campo

Validar card de obrigatoriedade do campo 'Nome'
    [Documentation]    Teste para validar que o campo 'Nome' é obrigatorio no momento do registro, e que a notificação e exibida em um card
    Tentar se registrar sem preencher o campo 'Nome'