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
    

    

    # Click Element    xpath://button[@title='Allow all cookies']
    # Page Should Contain    Create a new account
    # Click Element    name:firstname
    # Input Text    name:firstname    Jane

    # Click Element    name:lastname
    # Input Text    name:lastname    Doe

    # Click Element    name:reg_email__
    # Input Text    name:reg_email__    jane.doe@sjdflj.com

    # Click Element    name:reg_email_confirmation__
    # Input Text    name:reg_email_confirmation__    jane.doe@sjdflj.com

    # Click Element    name:reg_passwd__
    # Input Text    name:reg_passwd__    qwerty12345

    # Click Element    id:month
    # Select From List By Label    id:month   Jan

    # Click Element    id:day
    # Select From List By Label    id:day    24

    # Click Element    id:year
    # Select From List By Label    id:year    1987

    # Select Radio Button    sex    2

    # Set Screenshot Directory    C:\\Python311\\python\\Softwate_Testing\\RobotFiles\\dbDemo    
    # Capture Page Screenshot    screen.png

    # Close Browser





# *** Test Cases ***
# NY Times
#     Open Browser    http://nytimes.com    Firefox 
#     Set Screenshot Directory    C:\\Python311\\python\\Softwate_Testing\\RobotFiles\\dbDemo   
    
#     Maximize Browser Window
#     Click Button    xpath:/html/body/div[3]/div/button
#     Click Button    xpath://button[@data-testid='GDPR-reject']

#     # count the amount of elements
#     ${count}=    Get Element Count    xpath:/html/body/div[1]/div[2]/div/header/div[4]/ul/li[*]/a

#     # find a specific element (i think)
#     ${referencePosition}=    Get Vertical Position    xpath:/html/body/div[1]/div[2]/div/header/div[4]/ul/li[1]/a

#     FOR    ${index}    IN RANGE    2    ${count}
#         Log    ${index}
#         ${testposition}=    Get Vertical Position    xpath:/html/body/div[1]/div[2]/div/header/div[4]/ul/li[${index}]/a
#         Should Be Equal    ${referencePosition}    ${testposition}
#     END
#     Close Browser




