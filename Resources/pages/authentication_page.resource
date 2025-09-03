*** Settings ***
Library     SeleniumLibrary
Library     String
Resource    ../data/login_data.resource
Resource    ../locators/register_locators.resource
Resource    ../locators/authentication_locators.resource
Resource    ../locators/index_locators.resource

*** Variables ***
${nome}
${numero_conta}
${account}

*** Keywords ***
Realizar novo cadastro
    [Documentation]    Realiza o cadastro de uma nova conta sem saldo
    Wait Until Element Is Visible    ${authentication.buttonRegister}
    Click Element    ${authentication.buttonRegister}
    Sleep    2s
    Input Text    ${register.inputEmail}    ${user}
    Input Text    ${register.inputName}    ${name}
    Input Text    ${register.inputPassword}    ${password}
    Input Text    ${register.inputPasswordConfirmation}    ${password}
    Wait Until Keyword Succeeds    5x    1s    Click Element    ${register.buttonRegister}
    Verificar sucesso ao realizar novo cadastro

Verificar sucesso ao realizar novo cadastro
    [Documentation]    Verifica se o card de sucesso é exibido após o cadastro
    Wait Until Element Is Visible    ${register.cardSuccess}
    ${msg}    Get Text    ${register.cardSuccess}
    ${account}    Get Substring    ${msg}    8    -23
    Set Global Variable    ${account}
    Click Element    ${register.buttonClose}

Realizar login
    [Documentation]    Faz login e aguarda até o usuário estar logado
    Wait Until Element Is Visible    ${authentication.headerTitle}
    Input Text  ${authentication.inputEmail}  ${user}
    Input Text  ${authentication.inputPassword}  ${password}
    Click Button  ${authentication.buttonAccess}
    Sleep    2s
    Wait Until Element Is Visible    ${index.name}

Realizar logout
    [Documentation]    Faz logout e aguarda até o usuário estar deslogado
    Wait Until Element Is Visible    ${index.buttonLogout}
    Click Element    ${index.buttonLogout}
    Sleep    2s
    Wait Until Element Is Visible    ${authentication.headerTitle}

Validar informações da conta
    [Documentation]    Verifica que o nome e o número da conta estejam corretos
    ${nome}    Get Text    ${index.name}
    ${nome}    Get Substring    ${nome}    4    -1
    ${numero_conta}    Get Text    ${index.accountNumber}
    Should Be Equal As Strings   ${nome}    ${name}
    Should Be Equal As Strings    ${account}    ${numero_conta}