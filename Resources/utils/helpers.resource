*** Settings ***
Library    SeleniumLibrary
Library    String
Library    DateTime

*** Keywords ***
Retornar apenas números de valor monetário
    [Arguments]    ${valor}
    ${aux}    Replace String    ${valor}    R$    ${EMPTY}
    ${aux}    Replace String    ${aux}    ,    ${EMPTY}
    ${aux}    Replace String    ${aux}    .    ${EMPTY}
    ${aux}    Strip String    ${aux}
    Log    ${aux}
    [Return]    ${aux}

Retornar data atual
    [Documentation]    Retorna a data atual no formato dd/mm/yyyy
    ${data}    Get Current Date    result_format=%d/%m/%Y
    RETURN    ${data}