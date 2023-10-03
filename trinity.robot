# Group Members
#Edem Quashigah
# ADD YOURS HERE

*** Settings ***
Library    SeleniumLibrary
Library    String
Library    XML

*** Variables ***
${website}    http://jimms.fi


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
Test If Possible to Add Items to Cart
    
    Open Browser    ${website}    Chrome    options=add_experimental_option("detach", True)

    #Add 5 items to cart
    Add to Cart    xpath://*[@id="fp-suggestions-carousel1-slide02"]/div/product-box/div[2]/div[3]/addto-cart-wrapper/div/a
    Add to Cart     xpath://*[@id="fp-suggestions-carousel2-slide05"]/div/product-box/div[2]/div[3]/addto-cart-wrapper/div/a
    Add to Cart     xpath://*[@id="fp-suggestions-carousel2-slide03"]/div/product-box/div[2]/div[3]/addto-cart-wrapper/div/a
    Add to Cart     xpath://*[@id="jim-main"]/div[7]/div/div/div[2]/div/div[1]/product-box/div[2]/div[3]/addto-cart-wrapper/div/a
    Add to Cart     xpath://*[@id="jim-main"]/div[8]/div/div/div[2]/div/div[2]/product-box/div[2]/div[3]/addto-cart-wrapper/div/a
    



    