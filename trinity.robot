# Group Members
#Edem Quashigah
# ADD YOURS HERE

*** Settings ***
Library    SeleniumLibrary
Library    String
Library    XML

*** Variables ***
${website}    http://jimms.fi




*** Test Cases ***
Open Webpage
    Open Browser    ${website}    Chrome    options=add_experimental_option("detach", True)

    Maximize Browser Window

*** Test Cases ***
    # Do all product categories have a "landing page"
    ${count}=    Get Element Count    xpath://html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[*]/a

    ${referencePosition}=    Get Vertical Position    xpath://html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[1]/a

    FOR    ${index}    IN RANGE    ${count}
        Log    ${index}
        ${testPosition}=    Get Vertical Position    xpath//html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[${index}]/a

        
        
    END
    

    # Test search feature from main page (search keyword is: ps5)
        # robot takes element screenshot from first product
        # robot drills down to product page
        # robot checks that there is something in product page what matches to keyword what was used in search


    #