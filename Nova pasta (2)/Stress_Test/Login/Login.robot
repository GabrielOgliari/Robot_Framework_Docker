*** Settings ***
Resource    ../Stress_Test_main.robot

*** Test Cases ***
Teste de Stress Login
    FOR    ${counter}    IN RANGE    0    ${Execucao}
        Login_Geral
    END