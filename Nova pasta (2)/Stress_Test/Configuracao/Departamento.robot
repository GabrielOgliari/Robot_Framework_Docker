*** Settings ***
Resource    ../Stress_Test_main.robot

*** Variables ***
${URL}    https://api.configuracoes.m8sistemas.com/Treinamento


*** Keywords ***
Departamento Get
    Create Session    alias=Departamento    url=${URL}
    ${headers}=    Create Dictionary    Authorization=Bearer ${token}
    ${response}=    GET On Session    Departamento    /Departamento/GetById/10   headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}



*** Test Cases ***

Departamento Stress Test GET
    Login_Geral
    FOR    ${counter}    IN RANGE    0    ${Execucao}
    Departamento Get
    END
