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
Open Webpage
    Open Browser    ${website}    ${browser}    options=add_experimental_option("detach", True)

    Maximize Browser Window



# Edem (Task 1)
Landing Page
    # Do all product categories have a "landing page"
    # Get count of elements in the vertical path
    ${count}=    Get Element Count    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[*]/a

    # Iterate through all the elements
    FOR    ${index}    IN RANGE    1    ${count}+1
        Log    ${index}
        ${testElement}=    Set Variable
        ...    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[${index}]/a
        Log    ${testElement}
        ${text}=    Get Text    ${testElement}
        Log    ${text}

        # Check to make sure that each element has an 'href'
        ${testAttributes}=    Get Element Attribute    ${testElement}    href
        Run Keyword And Continue On Failure    Should Not Be Empty    ${testAttributes}
    END
    # close browser.
    Close Browser
    # End of task 1



# Task 2 - Marika Duhhanina
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



# Roy (Tasks 3 & 4)
Find the button "Lisää koriin" from a product page and take a screenshot of the button's element
    Open Browser
    ...    https://www.jimms.fi/fi/Product/Show/187202/ls34bg850suxen/samsung-34-odyssey-oled-g8-kaareva-175hz-oc-wqhd-pelimonitori-tarjous-norm-1249-00
    ...    ${browser}
    ...    options=add_experimental_option("detach", True)
    # Maximize Browser Window

    Page Should Contain Link
    ...    xpath:/html/body/main/div[1]/div[2]/div[1]/jim-product-cta-box/div/div[4]/div[2]/addto-cart-wrapper/div/a

    Set Screenshot Directory    C:\\Users\\royha\\OneDrive - Hämeen ammattikorkeakoulu\\Python\\TrinitySoftwareTesting
    Capture Element Screenshot
    ...    xpath:/html/body/main/div[1]/div[2]/div[1]/jim-product-cta-box/div/div[4]/div[2]/addto-cart-wrapper/div/a/span

    Close Browser
    # End of tasks 3 & 4



# Catarina (Task 5)
Test If Possible to Add Items to Cart
    Open Browser    ${website}    ${browser}    options=add_experimental_option("detach", True)
    Maximize Browser Window
# Add 5 items to cart
    Add to Cart
    ...    xpath://*[@id="fp-suggestions-carousel1-slide02"]/div/product-box/div[2]/div[3]/addto-cart-wrapper/div/a
    Add to Cart
    ...    xpath://*[@id="fp-suggestions-carousel2-slide05"]/div/product-box/div[2]/div[3]/addto-cart-wrapper/div/a
    Add to Cart
    ...    xpath://*[@id="fp-suggestions-carousel2-slide03"]/div/product-box/div[2]/div[3]/addto-cart-wrapper/div/a
    Add to Cart
    ...    xpath://*[@id="jim-main"]/div[7]/div/div/div[2]/div/div[1]/product-box/div[2]/div[3]/addto-cart-wrapper/div/a
    Add to Cart
    ...    xpath://*[@id="jim-main"]/div[8]/div/div/div[2]/div/div[2]/product-box/div[2]/div[3]/addto-cart-wrapper/div/a

    Close Browser
# End of task 5


# Roy Liu - Task 6
Search "Odyssey OLED G8" and add it into the shopping cart (Roy)
    Open Browser    ${website}    ${browser}    options=add_experimental_option("detach", True)
    
    Maximize Browser Window

    #Searching the product
    Click Element    name:q 
    Input Text    name:q    Odyssey OLED G8
    Press Keys    name:q    ENTER
    
    #Adding the product into the shopping cart
    Click Element    xpath:/html/body/main/div[2]/div/div[2]/div[5]/div/div/product-box/div[2]/div[3]/addto-cart-wrapper/div/a
#End of task 6


# Task 7
Check if the product is in the shopping cart and make a screenshot of the cart icon 
# #(Catarina)
    Open Browser    ${website}    ${browser}    options=add_experimental_option("detach", True)
    Maximize Browser Window
    
    
    # Add item to cart
    Add to Cart    xpath://*[@id="fp-suggestions-carousel1-slide02"]/div/product-box/div[2]/div[3]/addto-cart-wrapper/div/a

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
