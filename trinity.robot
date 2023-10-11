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
${website}    http://jimms.fi
${browser}    Chrome
${path}    C:\\Users\\edemq\\OneDrive - Hämeen ammattikorkeakoulu\\Työpöytä\\PythonHamk\\SoftwareTesting\\

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

# Task 1 - Edem Quashigah
*** Test Cases ***
Open Webpage
    # Open browser and maximize window
    Open Browser    ${website}    ${browser}    options=add_experimental_option("detach", True)
    Maximize Browser Window

Do all product categories have a "landing page"
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
        # Click link to confirm
        Click Element    ${testElement}
        Sleep    2s
    END

    Sleep    2s

    # close browser.
    Close Browser
    # End of task 1

*** Test Cases ***
# Task 2 - Marika Duhhanina
Search feature from main page
    Open Browser    https://www.jimms.fi/    ${browser}
    Maximize Browser Window
    Click Element    xpath://*[@id="searchinput"]
    Sleep    1s
    Input Text    name:q    ${searchElement}
    Sleep    2s
    Press Keys    name:q    ENTER
    Sleep    1s
# take a screenshot from first product
    Set Screenshot Directory    ${path}
    Wait Until Page Contains Element    xpath:/html/body/main/div[2]/div/div[2]/div[5]/div/div[1]/product-box    3
    Sleep    1s
    Capture Element Screenshot    xpath:/html/body/main/div[2]/div/div[2]/div[5]/div/div[1]/product-box
    
    Sleep    2s
# drill down to product page
    Click Element    xpath://*[@class="product-box-name"]

# check that there is smething in product page what matches to keyword what was used in search
    Page Should Contain    ${searchElement}
    Sleep    2s
    Close Browser
# End of Task 2 - Marika Duhhanina


*** Test Cases ***
# Tasks 3 & 4 - Roy Liu
Find the button "Lisää koriin" from a product page and take a screenshot of the button's element
    Open Browser    https://www.jimms.fi/fi/Product/Show/187202/ls34bg850suxen/samsung-34-odyssey-oled-g8-kaareva-175hz-oc-wqhd-pelimonitori-tarjous-norm-1249-00    ${browser}    options=add_experimental_option("detach", True)
     Maximize Browser Window
    Sleep    1s
    Page Should Contain Link    xpath:/html/body/main/div[1]/div[2]/div[1]/jim-product-cta-box/div/div[4]/div[2]/addto-cart-wrapper/div/a
    Sleep    2s

    Set Screenshot Directory    ${path}
    Capture Element Screenshot    xpath:/html/body/main/div[1]/div[2]/div[1]/jim-product-cta-box/div/div[4]/div[2]/addto-cart-wrapper/div/a/span
    
    Sleep    2s
    Close Browser
    # End of tasks 3 & 4


*** Test Cases ***
# Task 5 - Catarina Kaucher
Test If Possible to Add Items to Cart
    Open Browser    ${website}    ${browser}    options=add_experimental_option("detach", True)
    Maximize Browser Window
# Add 5 items to cart
    # Hover over the cart to show that the cart is empty.
    Sleep    1s
    Mouse Over    xpath:/html/body/header/div/div[3]/jim-cart-dropdown/div
    Sleep    2s
    Mouse Out    xpath:/html/body/header/div/div[3]/jim-cart-dropdown/div
    Sleep    1s
    
    Add to Cart    xpath://*[@id="fp-suggestions-carousel1-slide02"]/div/product-box/div[2]/div[3]/addto-cart-wrapper/div/a
    Sleep    1s
    Add to Cart    xpath://*[@id="fp-suggestions-carousel2-slide05"]/div/product-box/div[2]/div[3]/addto-cart-wrapper/div/a
    Sleep    1s
    Add to Cart    xpath://*[@id="fp-suggestions-carousel2-slide03"]/div/product-box/div[2]/div[3]/addto-cart-wrapper/div/a
    Sleep    1s
    Add to Cart    xpath://*[@id="jim-main"]/div[7]/div/div/div[2]/div/div[1]/product-box/div[2]/div[3]/addto-cart-wrapper/div/a
    Sleep    1s
    Add to Cart    xpath://*[@id="jim-main"]/div[8]/div/div/div[2]/div/div[2]/product-box/div[2]/div[3]/addto-cart-wrapper/div/a
    Sleep    1s
    
    # Hover mouse over the cart to check if the items have been added
    Mouse Over    xpath:/html/body/header/div/div[3]/jim-cart-dropdown/div

    Sleep    3s  

    Close Browser
# End of task 5


# Task 6 - Roy Liu
*** Test Cases ***
Search "Odyssey OLED G8" and add it into the shopping cart
    Open Browser    ${website}    ${browser}    options=add_experimental_option("detach", True)
    Maximize Browser Window
    Sleep    1s
    #Searching the product
    Click Element    name:q 
    Input Text    name:q    Odyssey OLED G8
    Sleep    1s
    Press Keys    name:q    ENTER

    Sleep    1s
    #Adding the product into the shopping cart
    Element Should Be Visible    xpath:/html/body/main/div[2]/div/div[2]/div[5]/div/div/product-box/div[2]/div[3]/addto-cart-wrapper/div/a
    Add to Cart    xpath:/html/body/main/div[2]/div/div[2]/div[5]/div/div/product-box/div[2]/div[3]/addto-cart-wrapper/div/a
    Sleep    2s
#End of task 6

# Task 7 - Catarina Kaucher
*** Test Cases ***
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
    Sleep    2s
#End of task 7


# Task 8 - Marika Duhhanina
*** Test Cases ***
Click "SIIRRY KASSALLE", fill out the form and click "SEURAAVA>>"

    Click Element    xpath:/html/body/main/div/div/div/div[2]/div/div[3]/a

    # Select Radio Button    selectedTab    value
    # The radio button doesn't have a value, so I had to use "Click Element" for this
    Click Element    xpath://*[@id="anonymous-tab-input"]
    Sleep    1s
    Click Element    xpath:/html/body/main/div/div/div/div[2]/div[4]/div/div/form/input[3]
    Sleep    1s
    Click Element    name:FirstName
    Input Text    name:FirstName    ${FirstName}
    Sleep    1s
    Click Element    name:LastName
    Input Text    name:LastName    ${LastName}
    Sleep    1s
    Click Element    name:Address
    Input Text    name:Address    ${Address}
    Sleep    1s
    Click Element    name:PostalCode
    Input Text    name:PostalCode    ${PostalCode}
    Sleep    1s
    Click Element    name:City
    Input Text    name:City    ${City}
    Sleep    1s
    Click Element    name:EmailAddress
    Input Text    name:EmailAddress    ${EmailAddress}
    Sleep    1s
    Click Element    name:Phone
    Input Text    name:Phone    ${Phone}
    Sleep    1s
    Select Checkbox    xpath://*[@id="GDPR"]

    Execute JavaScript    window.scrollTo(0, 400)    #Scrolling down the page
    Wait Until Element Is Visible    xpath:/html/body/main/div/div[2]/div/div[1]/form/div/input

    Sleep    1s
    Double Click Element    xpath:/html/body/main/div/div[2]/div/div[1]/form/div/input
    Sleep    2s
# End of task 8


# Task 9 - Marika Duhhanina
*** Test Cases ***
Choose "Nouto Turku" from the list and click "SEURAAVA>>"
    Wait Until Page Contains    Nouto Turku
    Page Should Contain    Nouto Turku

    Execute JavaScript    window.scrollTo(0, 400)    #Scrolling down the page
    Sleep    1s
    Select Radio Button    DeliveryMethodID    JTU2   
    
    Click Element    xpath:/html/body/main/div/div[2]/div/div[1]/div/div/div[1]/div/form/ul/li[6]/div/input
    Sleep    1s
    Double Click Element    xpath:/html/body/main/div/div[2]/div/div[1]/div/div/div[1]/div/form/input[2]
    Sleep    2s
# End of task 9


# Task 10 - Edem Quashigah 
*** Test Cases ***
Choose "Ennakkomaksu" and click "SEURAAVA>>", also verify the information filled out in the form are correct
    # Click 'Ennakkomaksu'
    Click Element    xpath:/html/body/main/div/div[2]/div/div[1]/div/div/div[2]/div/form/ul/li[3]/div/label/div[2]
    Sleep    1s
    # Click Seuraava
    Click Element    xpath:/html/body/main/div/div[2]/div/div[1]/div/div/div[2]/div/form/input[2]
    Sleep    2s
    # Set variables to be confirmed
    ${FirstName_confirm}=    Get Text    xpath:/html/body/main/div/div[2]/div/div[2]/div[2]/div[1]/div[2]/div[1]
    ${LastName_confirm}=    Get Text    xpath:/html/body/main/div/div[2]/div/div[2]/div[2]/div[1]/div[2]/div[1]
    ${Address_confirm}=    Get Text    xpath:/html/body/main/div/div[2]/div/div[2]/div[2]/div[1]/div[2]/div[2]
    ${PostalCode_confirm}=    Get Text    xpath:/html/body/main/div/div[2]/div/div[2]/div[2]/div[1]/div[2]/div[3]
    ${City_confirm}=    Get Text    xpath:/html/body/main/div/div[2]/div/div[2]/div[2]/div[1]/div[2]/div[3]
    ${EmailAddress_confirm}=    Get Text    xpath:/html/body/main/div/div[2]/div/div[2]/div[2]/div[1]/div[2]/div[5]
    ${Phone_confirm}=    Get Text    xpath:/html/body/main/div/div[2]/div/div[2]/div[2]/div[1]/div[2]/div[4]
    
    #Confirm if the details are the same
    Run Keyword And Continue On Failure    Should Contain    ${FirstName_confirm}    ${FirstName}
    Run Keyword And Continue On Failure    Should Contain    ${FirstName_confirm}    ${LastName}

    Run Keyword And Continue On Failure    Should Be Equal    ${Address_confirm}    ${Address}
    Run Keyword And Continue On Failure    Should Contain    ${PostalCode_confirm}    ${PostalCode}

    Run Keyword And Continue On Failure    Should Contain    ${City_confirm}    ${City}
    Run Keyword And Continue On Failure    Should Be Equal    ${EmailAddress_confirm}    ${EmailAddress}
    Run Keyword And Continue On Failure    Should Be Equal   ${Phone_confirm}    ${Phone}

    #Close Browser Window
    Close Browser

# End of task 10