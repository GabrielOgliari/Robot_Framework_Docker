*** Settings ***
Resource    ../Stress_Test_main.robot

*** Variables ***
${URL}    https://api.contabil.m8sistemas.com/Treinamento


*** Keywords ***
Historico Contabil Historico Get
    Create Session    alias=HistoricoContabilHistorico    url=${URL}
    ${headers}=    Create Dictionary    Authorization=Bearer ${token}
    ${response}=    GET On Session    HistoricoContabilHistorico    /ContabilHistorico/GetById/48  headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}



*** Test Cases ***

Historico Contabil Historico Stress Test GET
    Login_Geral
    FOR    ${counter}    IN RANGE    0    ${Execucao}
    Historico Contabil Historico Get
    END
