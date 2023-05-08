*** Settings ***
Resource    ../Stress_Test_main.robot

*** Variables ***
${URL}    https://api.configuracoes.m8sistemas.com/Treinamento


*** Keywords ***
Pessoa Sub Categoria Pessoa Get
    Create Session    alias=PessoaSubCategoriaPessoa    url=${URL}
    ${headers}=    Create Dictionary    Authorization=Bearer ${token}
    ${response}=    GET On Session    PessoaSubCategoriaPessoa    /SubCategoriaPessoa/GetById/7   headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}



*** Test Cases ***

Pessoa Sub Categoria Pessoa Stress Test GET
    Login_Geral
    FOR    ${counter}    IN RANGE    0    ${Execucao}
    Pessoa Sub Categoria Pessoa Get
    END
