*** Settings ***
Resource    ../Stress_Test_main.robot

*** Variables ***
${URL}    https://api.fiscal.m8sistemas.com/Treinamento


*** Keywords ***
Notas Fiscais Serie Nota Fiscal Get
    Create Session    alias=NotasFiscaisSerieNotaFiscal    url=${URL}
    ${headers}=    Create Dictionary    Authorization=Bearer ${token}
    ${response}=    GET On Session    NotasFiscaisSerieNotaFiscal    /SerieNotaFiscal/GetById/37  headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}



*** Test Cases ***

Notas Fiscais Serie Nota Fiscal Stress Test GET
    Login_Geral
    FOR    ${counter}    IN RANGE    0    ${Execucao}
    Notas Fiscais Serie Nota Fiscal Get
    END
