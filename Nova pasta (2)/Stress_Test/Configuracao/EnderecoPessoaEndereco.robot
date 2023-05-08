*** Settings ***
Resource    ../Stress_Test_main.robot

*** Variables ***
${URL}    https://api.configuracoes.m8sistemas.com/Treinamento


*** Keywords ***
Endereço Pessoa Endereço Get
    Create Session    alias=EnderecoPessoaEndereco    url=${URL}
    ${headers}=    Create Dictionary    Authorization=Bearer ${token}
    ${response}=    GET On Session    EnderecoPessoaEndereco    /PessoaEndereco/GetById/43244  headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}



*** Test Cases ***

Endereço Pessoa Endereço Stress Test GET
    Login_Geral
    FOR    ${counter}    IN RANGE    0    ${Execucao}
    Endereço Pessoa Endereço Get
    END