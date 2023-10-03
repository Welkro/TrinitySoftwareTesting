*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    XML


*** Variables ***
${browser}=    Firefox
${searchElement}=    PS5


# Task 2 - Marika Duhhanina
*** Test Cases ***
Search feature from main page
    Open Browser    https://www.jimms.fi/    ${browser}
    Maximize Browser Window
    Click Element    xpath://*[@id="searchinput"]
    Input Text    name:q    ${searchElement}
    Press Keys    name:q    ENTER
    
# take a screenshot from first product
    Set Screenshot Directory    C:\\Python311\\python\\Softwate_Testing\\TrinitySoftwareTesting
    Wait Until Page Contains Element    xpath:/html/body/main/div[2]/div/div[2]/div[5]/div/div[1]/product-box    3
    Capture Element Screenshot    xpath:/html/body/main/div[2]/div/div[2]/div[5]/div/div[1]/product-box

# drill down to product page
    Click Element    xpath://*[@class="product-box-name"]

# check that there is smething in product page what matches to keyword what was used in search
    Page Should Contain    ${searchElement}
    
    Close Browser

# End of Task 2 - Marika Duhhanina


