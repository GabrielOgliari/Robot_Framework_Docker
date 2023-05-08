*** Settings ***
Resource    ../Stress_Test_main.robot

*** Variables ***
${URL}    https://api.configuracoes.m8sistemas.com/Treinamento


*** Keywords ***
Departamento Usuario Get
    Create Session    alias=DepartamentoUsuario    url=${URL}
    ${headers}=    Create Dictionary    Authorization=Bearer ${token}
    ${response}=    GET On Session    DepartamentoUsuario    /DepartamentoUsuario/GetById/6   headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}



*** Test Cases ***

Departamento Usuario Stress Test GET
    Login_Geral
    FOR    ${counter}    IN RANGE    0    ${Execucao}
    Departamento Usuario Get
    END
