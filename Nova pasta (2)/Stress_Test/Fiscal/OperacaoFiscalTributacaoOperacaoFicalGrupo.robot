*** Settings ***
Resource    ../Stress_Test_main.robot

*** Variables ***
${URL}    https://api.fiscal.m8sistemas.com/Treinamento


*** Keywords ***
Operacao Fiscal Tributacao Operacao Fical Grupo Get
    Create Session    alias=OperacaoFiscalTributacaoOperacaoFicalGrupo    url=${URL}
    ${headers}=    Create Dictionary    Authorization=Bearer ${token}
    ${response}=    GET On Session    OperacaoFiscalTributacaoOperacaoFicalGrupo    /TributacaoOperacaoFiscalGrupo/GetById/1  headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}



*** Test Cases ***

Operacao Fiscal Tributacao Operacao Fical Grupo Stress Test GET
    Login_Geral
    FOR    ${counter}    IN RANGE    0    ${Execucao}
    Operacao Fiscal Tributacao Operacao Fical Grupo Get
    END
