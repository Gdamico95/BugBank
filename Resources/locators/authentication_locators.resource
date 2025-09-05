*** Settings ***

Documentation    Mapeamento dos elementos na interface de autenticação

*** Variables ***

&{authentication}    inputEmail=//div[@class='card__login']/form/div/input[@name='email']
...                  inputPassword=//div[@class='card__login']/form/div/div/input[@name='password']
...                  buttonAccess=//div[@class='login__buttons']/button[@type='submit']
...                  buttonRegister=//div[@class='login__buttons']/button[@type='button']
...                  headerTitle=//h1
...                  warningEmailRequired=//input[@type='email']/ancestor-or-self::div/p
...                  warningPassRequired=//input[@type='password']/ancestor-or-self::div/p