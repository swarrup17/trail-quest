*** Variables ***
# Home Page Locators
${logo}    xpath=/html/body/div[1]/header/div[1]/div/div/div/a/img[1]
${home}    xpath=/html/body/div[1]/header/div[1]/div/div/div/div/div[2]/div[2]/ul/li[1]/a
${About}    xpath=/html/body/div[1]/header/div[1]/div/div/div/div/div[2]/div[2]/ul/li[3]/a/span
${Contact}    xpath=/html/body/div[1]/header/div[1]/div/div/div/div/div[2]/div[2]/ul/li[4]/a
${FAQ}    xpath=/html/body/div[1]/header/div[1]/div/div/div/div/div[2]/div[2]/ul/li[5]/a
${Login}    xpath=/html/body/div[1]/header/div[2]/div[1]/div/div[2]/div/ul/div[1]/a
${search_box}    xpath=/html/body/div[3]/section[1]/div[2]/div/div/div[2]/div/form/div/div/div[1]/div/input
${search_button}    xpath=/html/body/div[3]/section[1]/div[2]/div/div/div[2]/div/form/div/div/div[2]/div/button/i
${quiz}    xpath=//*[@id="openQuizModal"]


#Treks And Tours buttons
${trek_and_tours}    xpath=/html/body/div[1]/header/div[1]/div/div/div/div/div[2]/div[2]/ul/li[2]/a/i
${push_your_limit}    xpath=/html/body/div[1]/header/div[1]/div/div/div/div/div[2]/div[2]/ul/li[2]/ul/li[2]/a
${reconnect_with_nature}    xpath=/html/body/div[1]/header/div[1]/div/div/div/div/div[2]/div[2]/ul/li[2]/ul/li[3]/a
${declutter_your_mind}    xpath=/html/body/div[1]/header/div[1]/div/div/div/div/div[2]/div[2]/ul/li[2]/ul/li[4]/a
${explore_the_ancients}    xpath=/html/body/div[1]/header/div[1]/div/div/div/div/div[2]/div[2]/ul/li[2]/ul/li[5]/a

#push your limit buttons
${header}    xpath=/html/body/section[1]/div/h1

#Everest 3 passes trek
${everest_picture}    xpath=//img[contains(@alt,'Everest 3 Passes Trek')]
${everest_content}    xpath=//span[contains(text(),'Everest 3 Passes Trek')]

${everest_favorite}    xpath=//button[.//i[contains(@class,'icon-heart')]]
${everest_cart}    xpath=//button[@type='submit' and .//i[contains(@class,'fa-cart-shopping')]]

