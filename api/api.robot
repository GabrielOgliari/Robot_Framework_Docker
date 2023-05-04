*** Settings ***
Library           RequestsLibrary
Library           Collections
Library    String

*** Variables ***
${API Endpoint}   
${Username}       
${Password}       
${token}          none


*** Keywords ***
Login Test   
    Create Session    alias=api    url=${API Endpoint}    
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${data}=    Create Dictionary    Usuario=${Username}    Senha=${Password}    Dominio=
    ${response}=    POST On Session    api    /Auth/Login    json=${data}    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    200
    ${token}=    Set Variable If    '${response.json().get("results").get("token")}' != 'None'    ${response.json().get("results").get("token")}
    Log    ${token}
    Set Global Variable    ${token}    
    Log    Login Successful
    Log    ${token}

Get User Test
    Create Session    alias=api_vendedor    url=
    ${headers}=    Create Dictionary    Authorization=Bearer ${token}
    ${response}=    GET On Session    api_vendedor    /Vendedor/    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}


*** Test Cases ***
teste de esforço com 20
    FOR    ${counter}    IN RANGE    20
        Log    ${counter}
        Login Test
    END

