*** Settings ***
Resource    ../Stress_Test_main.robot

*** Variables ***
${URL}    https://api.fiscal.m8sistemas.com/Treinamento


*** Keywords ***
Notas Fiscais Mensagem Get
    Create Session    alias=NotasFiscaisMensagem    url=${URL}
    ${headers}=    Create Dictionary    Authorization=Bearer ${token}
    ${response}=    GET On Session    NotasFiscaisMensagem    /Mensagem/GetById/35  headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}



*** Test Cases ***

Notas Fiscais Mensagem Stress Test GET
    Login_Geral
    FOR    ${counter}    IN RANGE    0    ${Execucao}
    Notas Fiscais Mensagem Get
    END
