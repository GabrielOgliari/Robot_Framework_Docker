*** Settings ***
Resource    ../Stress_Test_main.robot

*** Variables ***
${URL}    https://api.configuracoes.m8sistemas.com/Treinamento


*** Keywords ***
Pasagens Balanca Local Trabalho Get
    Create Session    alias=PasagensBalanca_LocalTrabalho    url=${URL}
    ${headers}=    Create Dictionary    Authorization=Bearer ${token}
    ${response}=    GET On Session    PasagensBalanca_LocalTrabalho    /DepartamentoUsuario/GetById/6   headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}



*** Test Cases ***

Pasagens Balanca Local Trabalho Stress Test GET
    Login_Geral
    FOR    ${counter}    IN RANGE    0    ${Execucao}
    Pasagens Balanca Local Trabalho Get
    END
