*** Settings ***
Library     SeleniumLibrary
Library     String
Resource    ../data/login_data.resource
Resource    ../locators/register_locators.resource
Resource    ../locators/authentication_locators.resource
Resource    ../locators/index_locators.resource
Resource    ../utils/notifications.resource

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

Tentar fazer login sem preencher nenhum campo
    [Documentation]    Aciona o botão "Acessar" sem preencher nenhum campo
    Wait Until Element Is Visible    ${authentication.headerTitle}
    Clear Element Text    ${authentication.inputEmail}
    Clear Element Text    ${authentication.inputPassword}
    Click Button  ${authentication.buttonAccess}
    ${notificacaoEmail}    Get Text    ${authentication.warningEmailRequired}
    ${notificacaoSenha}    Get Text    ${authentication.warningPassRequired}
    Sleep    2s
    Validar notificação de obrigatoriedade dos campos de Login    ${notificacaoEmail}    ${notificacaoSenha}

Tentar se registrar sem preencher nenhum campo
    [Documentation]    Aciona o botão "Cadastrar" sem preencher nenhum campo
    Wait Until Element Is Visible    ${authentication.headerTitle}
    Click Element    ${authentication.buttonRegister}
    Sleep    2s
    Click Element    ${register.buttonRegister}
    ${notificacaoEmail}    Get Text    ${register.warningEmailRequired}
    ${notificacaoSenha}    Get Text    ${register.warningPassRequired}
    ${notificacaoConfirmacaoSenha}    Get Text    ${register.warningPassRequired}
    Validar notificação de obrigatoriedade dos campos para cadastro    ${notificacaoEmail}    ${notificacaoSenha}    ${notificacaoConfirmacaoSenha}

Tentar se registrar sem preencher o campo 'Nome'
    [Documentation]
    Wait Until Element Is Visible    ${authentication.headerTitle}
    Click Element    ${authentication.buttonRegister}
    Input Text    ${register.inputEmail}    ${user}
    Input Text    ${register.inputPassword}    ${password}
    Input Text    ${register.inputPasswordConfirmation}    ${password}
    Sleep    2s
    Click Element    ${register.buttonRegister}
    Wait Until Element Is Visible    ${register.cardNameRequired}
    ${notificacaoNome}    Get Text    ${register.cardNameRequired}
    Validar notificação de obrigatoriedade do campo 'Nome' para cadastrar-se    ${notificacaoNome}

Validar notificação de obrigatoriedade dos campos de Login
    [Documentation]    Verificar que o texto das notificações esteja conforme o esperado
    [Arguments]    ${notificacaoEmail}    ${notificacaoSenha}
    Should Be Equal    ${notificacaoEmail}    ${campoObrigatorio}
    Should Be Equal    ${notificacaoSenha}    ${campoObrigatorio}

Validar notificação de obrigatoriedade dos campos para cadastro
    [Documentation]    Verificar que o texto das notificações esteja conforme o esperado
    [Arguments]    ${notificacaoEmail}    ${notificacaoSenha}    ${notificacaoConfirmacaoSenha}
    Should Be Equal    ${notificacaoEmail}    ${campoObrigatorio}
    Should Be Equal    ${notificacaoSenha}    ${campoObrigatorio}
    Should Be Equal    ${notificacaoConfirmacaoSenha}    ${campoObrigatorio}

Validar notificação de obrigatoriedade do campo 'Nome' para cadastrar-se
    [Documentation]    Verificar que caso o campo 'Nome' não esteja preenchido, seja exibido um card
    ...                e o texto da notificação esteja conforme o esperado
    [Arguments]    ${notificacaoNome}
    Should Be Equal    ${notificacaoNome}    ${nomeNaoPodeSerVazio}
    Click Element    ${register.buttonClose}