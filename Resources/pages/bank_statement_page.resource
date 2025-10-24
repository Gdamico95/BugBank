*** Settings ***
Library     SeleniumLibrary
Library     String
Resource    ../locators/index_locators.resource
Resource    ../locators/bank_statement_locators.resource
Resource    ../utils/helpers.resource

*** Variables ***
${initialBalance1000}    100000      # R$1.000,00
${initialBalance0}       000         # R$0,00
${infoContaComSaldoInicial}    Saldo adicionado ao abrir conta
${infoContaSemSaldoInicial}    Cliente optou por não ter saldo ao abrir conta

*** Keywords ***
Acessar funcionalidade Extrato
    Click Element    ${index.buttonExtract}

Conferir conta criada sem saldo
    [Documentation]    Valida criação de conta sem saldo 
    Acessar funcionalidade Extrato
    Wait Until Element Is Visible    ${bankStatement.cardExtract}    
    Validar valor inicial da conta que foi criada sem saldo
    Validar data da abertura da conta
    Validar texto sobre saldo na abertura da conta    ${False}

Conferir conta criada com saldo
    [Documentation]    Valida criação de conta com saldo 
    Acessar funcionalidade Extrato
    Wait Until Element Is Visible    ${bankStatement.cardExtract}    
    Validar valor inicial da conta que foi criada com saldo
    Validar data da abertura da conta
    Validar texto sobre saldo na abertura da conta    ${True}

# VALIDAÇÕES
Validar valor inicial da conta que foi criada sem saldo
    [Documentation]    Validar o saldo inicial e o saldo disponível da conta que foi aberta sem saldo
    ${interface_saldo_disponivel}    Get Text    ${bankStatement.balanceAvailable}
    ${interface_saldo_disponivel}    Retornar apenas números de valor monetário    ${interface_saldo_disponivel}
    ${interface_saldo_inicial}    Get Text    ${bankStatement.balanceAtAccountOpening}
    ${interface_saldo_inicial}    Retornar apenas números de valor monetário    ${interface_saldo_inicial}
    Should Be Equal As Numbers    ${interface_saldo_disponivel}    ${initialBalance0}
    Should Be Equal As Numbers    ${interface_saldo_inicial}    ${initialBalance0}

Validar valor inicial da conta que foi criada com saldo
    [Documentation]    Validar o saldo inicial da conta que foi aberta com saldo
    ${interface_valor}    Get Text    ${bankStatement.balanceAvailable}
    ${interface_valor}    Retornar apenas números de valor monetário    ${interface_valor}
    Should Be Equal As Numbers    ${interface_valor}    ${initialBalance1000}

Validar data da abertura da conta
    [Documentation]    Validar se a conta foi criada na data atual
    ${dataAtual}    Retornar data atual
    ${interface_data}    Get Text    ${bankStatement.accountCreateDate}
    Should Be Equal    ${dataAtual}    ${interface_data}

Validar texto sobre saldo na abertura da conta
    [Documentation]    Validar o texto informado na tela "Extrato" dependendo da escolha do cliente na criação da conta
    ...                False irá validar conta criada sem saldo | True irá validar conta criada com saldo
    [Arguments]    ${saldo}
    ${infoSaldoInicial}    Get Text    ${bankStatement.clientChoose}
    IF    '${saldo}' == ${True}
        Should Be Equal    ${infoSaldoInicial}    ${infoContaComSaldoInicial}   
    ELSE IF    '${saldo}' == ${False}
        Should Be Equal    ${infoSaldoInicial}    ${infoContaSemSaldoInicial}
    END
