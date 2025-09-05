*** Variables ***

&{register}    inputEmail=//div[@class='card__register']/form/div/input[@name='email']
...            inputName=//div[@class='card__register']/form/div/input[@name='name']
...            inputPassword=//div[@class='card__register']/form/div/div/input[@name='password']
...            inputPasswordConfirmation=//div[@class='card__register']/form/div/div/input[@name='passwordConfirmation']
...            buttonRegister=//div[@class='card__register']/form/button
...            cardSuccess=//p[@id='modalText']
...            buttonClose=btnCloseModal
...            warningEmailRequired=//div[@class='card__register']/form/div/input[@name='email']/ancestor-or-self::div/p
...            warningPassRequired=//div[@class='card__register']/form/div/div/input[@name='password']/ancestor-or-self::div/p
...            warningPassConfirmationRequired=//div[@class='card__register']/form/div/div/input[@name='passwordConfirmation']/ancestor-or-self::div/p
...            cardNameRequired=//p[@id='modalText']