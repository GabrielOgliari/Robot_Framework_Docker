*** Settings ***
Resource    ../Stress_Test_main.robot

*** Variables ***
${URL}    https://api.configuracoes.m8sistemas.com/Treinamento


*** Keywords ***
Endereço Municipio Aliquota Get
    Create Session    alias=EnderecoMunicipioAliquota    url=${URL}
    ${headers}=    Create Dictionary    Authorization=Bearer ${token}
    ${response}=    GET On Session    EnderecoMunicipioAliquota    /MunicipioAliquota/GetById/2005  headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}



*** Test Cases ***

Endereço Municipio Aliquota Stress Test GET
    Login_Geral
    FOR    ${counter}    IN RANGE    0    ${Execucao}
    Endereço Municipio Aliquota Get
    END