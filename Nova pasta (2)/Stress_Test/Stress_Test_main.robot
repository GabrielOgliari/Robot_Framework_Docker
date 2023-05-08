*** Settings ***
Library    FakerLibrary    locale=pt_BR
Library    String
Library    RequestsLibrary

# Resource    ../Resurce/main.robot

Resource    Login_Todos.robot

### Configuração ####
# Resource     Configuração/Bacen.robot
*** Variables ***
${Execucao}    10