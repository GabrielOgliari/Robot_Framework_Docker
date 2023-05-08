*** Settings ***
Resource    Stress_Test_main.robot

*** Variables ***
${API Endpoint}   https://api.autenticacao.m8sistemas.com/Treinamento
${Username}       dev
${Password}       dev
${token}          none

*** Keywords ***
Login_Geral
    Create Session    alias=api    url=${API Endpoint}    
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${data}=    Create Dictionary    Usuario=${Username}    Senha=${Password}    Dominio=app.erpm8.cloud
    ${response}=    POST On Session    api    /Autenticacao/Login    json=${data}    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    200
    ${token}=    Set Variable If    '${response.json().get("results").get("token")}' != 'None'    ${response.json().get("results").get("token")}
    Log    ${token}
    Set Global Variable    ${token}    
    Log    Login Successful
    Log    ${token}