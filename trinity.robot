*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library     XML

*** Test Cases ***
Find the button "Lisää koriin" from a product page and take a screenshot of the button's element
# Access the website
    Open Browser    https://www.jimms.fi/fi/Product/Show/187202/ls34bg850suxen/samsung-34-odyssey-oled-g8-kaareva-175hz-oc-wqhd-pelimonitori-tarjous-norm-1249-00
    ...    Chrome    options=add_experimental_option("detach", True)
    #Maximize Browser Window

    Page Should Contain Link    xpath:/html/body/main/div[1]/div[2]/div[1]/jim-product-cta-box/div/div[4]/div[2]/addto-cart-wrapper/div/a

    Set Screenshot Directory    C:\\Users\\royha\\OneDrive - Hämeen ammattikorkeakoulu\\Python\\TrinitySoftwareTesting
    Capture Element Screenshot    xpath:/html/body/main/div[1]/div[2]/div[1]/jim-product-cta-box/div/div[4]/div[2]/addto-cart-wrapper/div/a/span