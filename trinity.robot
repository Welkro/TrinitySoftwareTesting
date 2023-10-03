*** Comments ***
# Group Members
# Edem Quashigah
# Roy Liu
# Catarina Kaucher
# Marika Duhhanina


*** Settings ***
Library     SeleniumLibrary
Library     String
Library     XML


*** Variables ***
${website}      http://jimms.fi

*** Keywords ***
Add to Cart
    [Arguments]    ${cartAdd}
    Sleep    1s
    Run Keyword and Ignore Error    Scroll Element Into View    ${cartAdd}
    Sleep    1s
    Click Element    ${cartAdd}


*** Test Cases ***
Open Webpage
    Open Browser    ${website}    Chrome    options=add_experimental_option("detach", True)

    Maximize Browser Window



*** Test Cases ***
#Edem (Task 1)
Landing Page
    # Do all product categories have a "landing page"
    # Get count of elements in the vertical path
    ${count}=    Get Element Count    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[*]/a

    # Iterate through all the elements
    FOR    ${index}    IN RANGE    1    ${count}+1
        Log    ${index}
        ${testElement}=    Set Variable    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[${index}]/a
        Log    ${testElement}
        ${text}=    Get Text    ${testElement}
        Log    ${text}
        
        # Check to make sure that each element has an 'href'
        ${testAttributes}=    Get Element Attribute    ${testElement}    href
        Run Keyword And Continue On Failure    Should Not Be Empty    ${testAttributes}
        
    END
    # close browser.
    Close Browser

# Roy task 3 & 4
Find the button "Lisää koriin" from a product page and take a screenshot of the button's element
    Open Browser
    ...    https://www.jimms.fi/fi/Product/Show/187202/ls34bg850suxen/samsung-34-odyssey-oled-g8-kaareva-175hz-oc-wqhd-pelimonitori-tarjous-norm-1249-00
    ...    Chrome
    ...    options=add_experimental_option("detach", True)
    # Maximize Browser Window

    Page Should Contain Link
    ...    xpath:/html/body/main/div[1]/div[2]/div[1]/jim-product-cta-box/div/div[4]/div[2]/addto-cart-wrapper/div/a

    Set Screenshot Directory    C:\\Users\\royha\\OneDrive - Hämeen ammattikorkeakoulu\\Python\\TrinitySoftwareTesting
    Capture Element Screenshot
    ...    xpath:/html/body/main/div[1]/div[2]/div[1]/jim-product-cta-box/div/div[4]/div[2]/addto-cart-wrapper/div/a/span

    Close Browser

# Catarina task 5
Test If Possible to Add Items to Cart
    Open Browser    ${website}    Chrome    options=add_experimental_option("detach", True)
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



