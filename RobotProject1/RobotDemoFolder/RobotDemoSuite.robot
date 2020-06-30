*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary
Suite Setup       Log to Console    Uitgevoerd voor elke test SUITE
Suite Teardown    Log to Console    Uitgevoerd na elke test SUITE
Test Setup        Log to Console    Uitgevoerd voor elke test CASE
Test Teardown     Log to Console    Uitgevoerd na elke test CASE
   


*** Test Cases ***
DemoHelloWorld
    [Tags]    smoking
    Log    Hallo Ebici
  
    
FirstSeleniumTest  
   
    Open Browser    https://google.com    chrome
    Input Text    name=q    Ebicus
    Close Browser       

LoginSeleniumTest
    Set Selenium Speed    0.3s  
    Open Browser    http://192.168.43.8:7777/ecommunications_enu    chrome  
    Input Text    id=s_swepi_1    SADMIN  
    Input Text    id=s_swepi_2    SADMIN
    Click Element    id=s_swepi_22   
    Wait Until Page Contains Element    id=s_sctrl_tabScreen  
    Click Element    id=siebui-toolbar-settings
    Click Element    id=tb_item_4
    Close Browser  
    Log    Test Completed   
    
Accounts
    Set Selenium Speed    0.3s
    Open Browser    http://192.168.43.8:7777/ecommunications_enu    chrome
    LoginKW    SADMIN
    Wait Until Page Contains Element    //button[@title="First Level View Bar"]  
    Click Element    //button[@title="First Level View Bar"]
    Click Link    //a[@id="ui-id-96"]
    Click Element    //button[@title="Second Level View Bar"]
    Click Link    //a[@id="ui-id-115"]
    Click Element    //button[@name="s_1_1_10_0"]
    ${account}    FakerLibrary.Words    
    Input Text    //input[@name="Name"]    ${account}
    Click Element    //li[@name="Root"]
    Click Element    xpath=(//button[@class="siebui-ctrl-btn appletButton"])[2]
    Close Browser

Agreements
    Set Selenium Speed    0.3s
    Open Browser    http://192.168.43.8:7777/ecommunications_enu    chrome
    LoginKW    SADMIN
    Wait Until Page Contains Element    //button[@title="First Level View Bar"]  
    Click Element    //button[@title="First Level View Bar"]
    Click Link    //a[@id="ui-id-97"]
    Click Element    //button[@name="s_1_1_11_0"]
    ${account}    FakerLibrary.Words
    Input Text    //input[@name="Name"]     ${account}
    Click Element    //td[@id="1Agreement_Status"]
    
    Click Element    //button[@name="s_1_1_10_0"]
    Click Element    //td[@id="1Name"]
    Input Text    //input[@name="Name"]     ${account}
    Press Keys    //input[@name="Name"]    ENTER    
    Click Element    //li[@name="Root"]
    Click Element    xpath=(//button[@class="siebui-ctrl-btn appletButton"])[2]
    Close Browser

HealthCheck
    Set Selenium Speed    0.3s
    Open Browser    http://192.168.43.8:7777/ecommunications_enu    chrome
    Set Browser Implicit Wait    3s
    LoginKW    SADMIN
    Wait Until Page Contains Element    //button[@title="First Level View Bar"]
    Click Element    //span[@class="siebui-icon-tb-sitemap ToolbarButtonOn"]
    Wait Until Page Contains Element    //input[@id="sitemapFilterInput"] 
    Input Text    //input[@id="sitemapFilterInput"]    server
    Click Link    //a[@name="s_a_60"]
    Click Element    //button[@title="Second Level View Bar"]
    Click Link    //a[@id="ui-id-115"]
    Click Element    //button[@name="s_2_1_17_0"]
    Input Text    //input[@name="Service_Full_Name"]    JMS Receiver
    Press Keys    //input[@name="Service_Full_Name"]     ENTER
    ${Status}     Get Text    //td[@id="1State"]  
    Log   ${Status}  
    Should Be Equal As Strings    Offline    ${Status}    
    Click Element    //li[@name="Root"]
    Click Element    xpath=(//button[@class="siebui-ctrl-btn appletButton"])[2]
    Close Browser

*** Keywords ***
LoginKW
    [Documentation]    
    ...    Inlogacties
    ...   
    [Arguments]    ${USER}
    
    Input Text    //input[@name="SWEUserName"]    ${USER}
    Input Text    //input[@name="SWEPassword"]    ${USER}
    Click Link    //a[@id="s_swepi_22"]
      