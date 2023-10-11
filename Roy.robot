*** Comments ***
# Group Members:

# Edem Quashigah
# Roy Liu
# Catarina Kaucher
# Marika Duhhanina


*** Settings ***
Library     SeleniumLibrary
Library     String
Library     XML


*** Variables ***
${website}              http://jimms.fi

# Set which browser to use
#${browser}=             Firefox
${browser}=             Chrome

${searchElement}=       PS5
# Task 8 variables (To be referred in Task 10)
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
# Task 6 - Roy Liu
Search "Odyssey OLED G8" and add it into the shopping cart (Roy)
    Open Browser    ${website}    ${browser}    options=add_experimental_option("detach", True)
    
    Maximize Browser Window

    #Searching the product
    Click Element    name:q 
    Input Text    name:q    Odyssey OLED G8
    Press Keys    name:q    ENTER

    Sleep    1s
    #Adding the product into the shopping cart
    Element Should Be Visible    xpath:/html/body/main/div[2]/div/div[2]/div[5]/div/div/product-box/div[2]/div[3]/addto-cart-wrapper/div/a
    Add to Cart    xpath:/html/body/main/div[2]/div/div[2]/div[5]/div/div/product-box/div[2]/div[3]/addto-cart-wrapper/div/a
#End of task 6


# Task 7 - Catarina Kaucher
Check if the product is in the shopping cart and make a screenshot of the cart icon 

    # Screenshot of the cart icon
    Capture Element Screenshot    xpath://*[@id="headercartcontainer"]/a
    
    Sleep    1s
    # Click on the cart
    Click Element    xpath://*[@id="headercartcontainer"]/a

    # Check if we are at the cart page
    Page Should Contain    Ostoskori

    # Verifying that the cart has an item
    Element Should Be Visible    xpath://*[@id="jim-main"]/div/div/div/div[1]/article/div[1]/div[2]/div/div[1]/div/a/span

    # Get the total
    ${total}=    Get Text    xpath://*[@id="jim-main"]/div/div/div/div[2]/div/div[1]/ul/li[5]/span

    #Remove unnecessary characters and spaces
    #STrip all spaces and convert comma into a dot
    ${total}=    Remove String    ${total}    €
    ${total}=    Set Variable    ${total.replace(" ", "").replace(",", "")}

    ${total}=    Convert To Integer    ${total}

    # Verify that the cart is not empty also by checking that the  total is above 0
    Should Be True     ${total} > 0    
#End of task 7


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
    
    Click Element    xpath:/html/body/main/div/div[2]/div/div[1]/div/div/div[1]/div/form/input[2]
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
