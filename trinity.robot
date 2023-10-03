# Group Members
#Edem Quashigah
# ADD YOURS HERE

*** Settings ***
Library    SeleniumLibrary
Library    String


*** Variables ***
${website}    http://jimms.fi




*** Test Cases ***
Open Webpage
    Open Browser    ${website}    Chrome    options=add_experimental_option("detach", True)
    #Open Browser    ${website}    Firefox

    Maximize Browser Window

    Reload Page

*** Test Cases ***
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


    # Test search feature from main page (search keyword is: ps5)
        # robot takes element screenshot from first product
        # robot drills down to product page
        # robot checks that there is something in product page what matches to keyword what was used in search
        
    #