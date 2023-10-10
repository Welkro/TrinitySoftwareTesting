*** Settings ***
Library    SeleniumLibrary
Library    String


*** Variables ***
${website}    http://jimms.fi
${browser}    Chrome
${FirstName}    Malong
${LastName}    Dig
${Address}    Ottostraße 63
${PostalCode}    85521
${City}    Ottobrunn
${EmailAddress}    malong.dig1987@gmail.com
${Phone}    +358 4573987264


*** Keywords ***
Add to Cart
## DONT remove
## Made by Catarina
    [Arguments]    ${cartAdd}
    Sleep    1s
    Run Keyword and Ignore Error    Scroll Element Into View    ${cartAdd}
    Sleep    1s
    Click Element    ${cartAdd}


*** Test Cases ***
Open Webpage
    Open Browser    ${website}    ${browser}    options=add_experimental_option("detach", True)
    Maximize Browser Window
    Reload Page

# Roy Liu - Task 6
Search "Odyssey OLED G8" and add it into the shopping cart (Roy)
    #Searching the product
    Click Element    name:q 
    Input Text    name:q    Odyssey OLED G8
    Press Keys    name:q    ENTER
    
    #Adding the product into the shopping cart
    Sleep    2s
    Click Element    xpath://html/body/main/div[2]/div/div[2]/div[5]/div/div/product-box/div[2]/div[3]/addto-cart-wrapper/div/a
    #Click Element    xpath:/html/body/main/div[2]/div/div[2]/div[5]/div/div/product-box/div[2]/div[3]/addto-cart-wrapper/div/a
    #Click add to cart 
    Sleep    2s
    Click Element    xpath:/html/body/header/div/div[3]/jim-cart-dropdown/div
    
#End of task 6

# Task 8 - Marika Duhhanina
Click "SIIRRY KASSALLE", fill out the form and click "SEURAAVA>>"


    Click Element    xpath:/html/body/main/div/div/div/div[2]/div/div[3]/a

    # Select Radio Button    selectedTab    value
    # The radio button doesn't have a value, so I had to use "Click Element" for this
    Click Element    xpath://*[@id="anonymous-tab-input"]

    Click Element    xpath:/html/body/main/div/div/div/div[2]/div[4]/div/div/form/input[3]

    Click Element    name:FirstName
    Input Text    name:FirstName    ${FirstName}

    Click Element    name:LastName
    Input Text    name:LastName    ${LastName}

    Click Element    name:Address
    Input Text    name:Address    ${Address}

    Click Element    name:PostalCode
    Input Text    name:PostalCode    ${PostalCode}

    Click Element    name:City
    Input Text    name:City    ${City}

    Click Element    name:EmailAddress
    Input Text    name:EmailAddress    ${EmailAddress}

    Click Element    name:Phone
    Input Text    name:Phone    ${Phone}

    Select Checkbox    xpath://*[@id="GDPR"]

    Click Element    xpath:/html/body/main/div/div[2]/div/div[1]/form/div/input
# End of task 8

# Task 9 - Marika Duhhanina
Choose "Nouto Turku" from the list and click "SEURAAVA>>"
    Wait Until Page Contains    Nouto Turku
    Page Should Contain    Nouto Turku

    Select Radio Button    DeliveryMethodID    JTU2   
    

    Sleep    2s 
    Click Element    xpath:/html/body/footer/div[1]/div[1]/div[2]/div/div[2]/div/a
    Click Element    /html/body/main/div/div[2]/div/div[1]/div/div/div[1]/div/form/input[2]
    
# End of task 9

# Task 10 - Edem Quashigah 
Choose "Ennakkomaksu" and click "SEURAAVA>>", also verify the information filled out in the form are correct (Edem)
    # Click 'Ennakkomaksu'
    Click Element    xpath:/html/body/main/div/div[2]/div/div[1]/div/div/div[2]/div/form/ul/li[3]/div/label/div[2]
    # Click Seuraava
    Click Element    xpath:/html/body/main/div/div[2]/div/div[1]/div/div/div[2]/div/form/input[2]
    # Set variables to be confirmed
    ${FirstName_confirm}=    Get Text    xpath:/html/body/main/div/div[2]/div/div[2]/div[2]/div[1]/div[2]/div[1]
    ${LastName_confirm}=    Get Text    xpath:/html/body/main/div/div[2]/div/div[2]/div[2]/div[1]/div[2]/div[1]
    ${Address_confirm}=    Get Text    xpath:/html/body/main/div/div[2]/div/div[2]/div[2]/div[1]/div[2]/div[2]
    ${PostalCode_confirm}=    Get Text    xpath:/html/body/main/div/div[2]/div/div[2]/div[2]/div[1]/div[2]/div[3]
    ${City_confirm}=    Get Text    xpath:/html/body/main/div/div[2]/div/div[2]/div[2]/div[1]/div[2]/div[3]
    ${EmailAddress_confirm}=    Get Text    xpath:/html/body/main/div/div[2]/div/div[2]/div[2]/div[1]/div[2]/div[5]
    ${Phone_confirm}=    Get Text    xpath:/html/body/main/div/div[2]/div/div[2]/div[2]/div[1]/div[2]/div[4]

    Run Keyword And Continue On Failure    Should Contain    ${FirstName_confirm}    ${FirstName}
    Run Keyword And Continue On Failure    Should Contain    ${FirstName_confirm}    ${LastName}

    Run Keyword And Continue On Failure    Should Be Equal    ${Address_confirm}    ${Address}
    Run Keyword And Continue On Failure    Should Contain    ${PostalCode_confirm}    ${PostalCode}

    Run Keyword And Continue On Failure    Should Contain    ${City_confirm}    ${City}
    Run Keyword And Continue On Failure    Should Be Equal    ${EmailAddress_confirm}    ${EmailAddress}
    Run Keyword And Continue On Failure    Should Be Equal   ${Phone_confirm}    ${Phone}

