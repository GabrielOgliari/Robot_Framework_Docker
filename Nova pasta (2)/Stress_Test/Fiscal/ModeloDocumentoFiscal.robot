*** Settings ***
Resource    ../Stress_Test_main.robot

*** Variables ***
${URL}    https://api.fiscal.m8sistemas.com/Treinamento


*** Keywords ***
Modelo Documento Fiscal Get
    Create Session    alias=ModeloDocumentoFiscal    url=${URL}
    ${headers}=    Create Dictionary    Authorization=Bearer ${token}
    ${response}=    GET On Session    ModeloDocumentoFiscal    /ModeloDocumentoFiscal/GetById/3  headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}



*** Test Cases ***

Modelo Documento Fiscal Stress Test GET
    Login_Geral
    FOR    ${counter}    IN RANGE    0    ${Execucao}
    Modelo Documento Fiscal Get
    END
