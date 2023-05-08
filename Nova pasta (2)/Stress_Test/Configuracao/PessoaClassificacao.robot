*** Settings ***
Resource    ../Stress_Test_main.robot

*** Variables ***
${URL}    https://api.configuracoes.m8sistemas.com/Treinamento


*** Keywords ***
Pessoa Classificacao Get
    Create Session    alias=PessoaClassificacao    url=${URL}
    ${headers}=    Create Dictionary    Authorization=Bearer ${token}
    ${response}=    GET On Session    PessoaClassificacao    /PessoaCategoria/GetById/7    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}



*** Test Cases ***

Pessoa Classificacao Stress Test GET
    Login_Geral
    FOR    ${counter}    IN RANGE    0    ${Execucao}
    Pessoa Classificacao Get
    END
