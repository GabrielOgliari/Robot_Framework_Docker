*** Settings ***
Resource    ../Stress_Test_main.robot

*** Variables ***
${URL}    https://api.fiscal.m8sistemas.com/Treinamento


*** Keywords ***
Operacao Fiscal Cfop Get
    Create Session    alias=OperacaoFiscalCfop    url=${URL}
    ${headers}=    Create Dictionary    Authorization=Bearer ${token}
    ${response}=    GET On Session    OperacaoFiscalCfop    /Cfop/GetById/299  headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}



*** Test Cases ***

Operacao Fiscal Cfop Stress Test GET
    Login_Geral
    FOR    ${counter}    IN RANGE    0    ${Execucao}
    Operacao Fiscal Cfop Get
    END
