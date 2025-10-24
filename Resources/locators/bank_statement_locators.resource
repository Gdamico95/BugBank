*** Settings ***

Documentation    Mapeamento dos elementos na interface "Extrato"

*** Variables ***

&{bankStatement}    cardExtract=//div[@class='bank-statement__ContainerTransactions-sc-7n8vh8-8 CUAzQ']
...                 balanceAvailable=textBalanceAvailable
...                 accountCreateDate=textDateTransaction
...                 balanceAtAccountOpening=textTransferValue
...                 clientChoose=textDescription