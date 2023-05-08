*** Settings ***
Resource    ../Stress_Test_main.robot

*** Variables ***
${URL}    https://api.configuracoes.m8sistemas.com/Treinamento


*** Keywords ***
Veiculo Tipo Veiculo Get
    Create Session    alias=VeiculoTipoVeiculo    url=${URL}
    ${headers}=    Create Dictionary    Authorization=Bearer ${token}
    ${response}=    GET On Session    VeiculoTipoVeiculo    /TipoVeiculo/GetById/4  headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}



*** Test Cases ***

Veiculo Tipo Veiculo Stress Test GET
    Login_Geral
    FOR    ${counter}    IN RANGE    0    ${Execucao}
    Veiculo Tipo Veiculo Get
    END
