*** Variables ***

&{register}    inputEmail=//div[@class='card__register']/form/div/input[@name='email']
...            inputName=//div[@class='card__register']/form/div/input[@name='name']
...            inputPassword=//div[@class='card__register']/form/div/div/input[@name='password']
...            inputPasswordConfirmation=//div[@class='card__register']/form/div/div/input[@name='passwordConfirmation']
...            buttonRegister=//div[@class='card__register']/form/button
...            cardSuccess=//p[@id='modalText']
...            buttonClose=btnCloseModal