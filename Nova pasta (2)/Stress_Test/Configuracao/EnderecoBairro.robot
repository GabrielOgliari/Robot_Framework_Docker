*** Settings ***
Resource    ../Stress_Test_main.robot

*** Variables ***
${URL}    https://api.configuracoes.m8sistemas.com/Treinamento


*** Keywords ***
Endereço Bairro Get
    Create Session    alias=EnderecoBairro    url=${URL}
    ${headers}=    Create Dictionary    Authorization=Bearer ${token}
    ${response}=    GET On Session    EnderecoBairro    /Bairro/GetById/473    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}



*** Test Cases ***

Endereço Bairro Stress Test GET
    Login_Geral
    FOR    ${counter}    IN RANGE    0    ${Execucao}
    Endereço Bairro Get
    END