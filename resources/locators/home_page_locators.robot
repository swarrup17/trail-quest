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
${HANDLES}=    Get Window Handles
${MAIN_WIN}=    Set Variable    ${HANDLES}[0]
${home_nav}    xpath=/html/body/div[1]/header/div[2]/div[2]/div[2]/button

#Treks And Tours buttons
${trek_and_tours}    xpath=/html/body/div[1]/header/div[1]/div/div/div/div/div[2]/div[2]/ul/li[2]/a/i
${push_your_limit}    xpath=/html/body/div[1]/header/div[1]/div/div/div/div/div[2]/div[2]/ul/li[2]/ul/li[2]/a
${reconnect_with_nature}    xpath=/html/body/div[1]/header/div[1]/div/div/div/div/div[2]/div[2]/ul/li[2]/ul/li[3]/a
${declutter_your_mind}    xpath=/html/body/div[1]/header/div[1]/div/div/div/div/div[2]/div[2]/ul/li[2]/ul/li[4]/a
${explore_the_ancients}    xpath=/html/body/div[1]/header/div[1]/div/div/div/div/div[2]/div[2]/ul/li[2]/ul/li[5]/a
${need_help}    xpath=/html/body/div[3]/nav/div/div/div/a
#push your limit buttons
${header}    xpath=/html/body/div[3]/section/div/div/div[3]/section/div/div/div/div[2]
${easy}    xpath=/html/body/div[3]/section/div/div/ul/li[1]/h3
${moderate}    xpath=/html/body/div[3]/section/div/div/ul/li[2]/h3
${challenging}    xpath=/html/body/div[3]/section/div/div/ul/li[3]/h3
#Easy-Everest 3 passes trek
${everest_picture}    xpath=/html/body/div[3]/section/div/div/div[3]/section/div/div/div/div[2]/div[1]
${everest_content}    xpath=//span[contains(text(),'Everest 3 Passes Trek')]
${everest_favorite}    xpath=//button[.//i[contains(@class,'icon-heart')]]
${everest_cart}    xpath=//button[@type='submit' and .//i[contains(@class,'fa-cart-shopping')]]
${everest_header}    xpath=/html/body/div[3]/div[1]/section[1]/div/div[1]/div[1]/h1
${e_share}    xpath=//*[@id="dropdownMenuShare"]
${e_facebook}    xpath=/html/body/div[3]/div[1]/section[1]/div/div[1]/div[2]/div/div[1]/div/div/a[1]
${e_twitter}    xpath=/html/body/div[3]/div[1]/section[1]/div/div[1]/div[2]/div/div[1]/div/div/a[2]
${nav_bar}    xpath=/html/body/div[3]/nav
${intro}    xpath=/html/body/div[3]/nav/div/div/ul/li[1]/a
${KBYG}    xpath=/html/body/div[3]/nav/div/div/ul/li[2]/a
${highlights}    xpath=/html/body/div[3]/nav/div/div/ul/li[3]/a
&{who_for}    xpath=//a[@data-section='nav-whotrekfor' and contains(@class,'active')]
${who_not_for}    xpath=/html/body/div[3]/nav/div/div/ul/li[5]/a
${itenary}    xpath=/html/body/div[3]/nav/div/div/ul/li[6]/a
${include_exclude}    xpath=/html/body/div[3]/nav/div/div/ul/li[7]/a
${imp_info}    xpath=/html/body/div[3]/nav/div/div/ul/li[8]/a
${e_faq}    xpath=/html/body/div[3]/nav/div/div/ul/li[9]/a
${into_vis}    xpath=xpath=/html/body/div[3]/section[1]/div/div/div[1]/div[1]/div/div/p[3]/span/span
${kbyg_vis}    xpath=xpath=/html/body/div[3]/section[1]/div/div/div[1]/div[2]/div/div[2]
${high_vis}    xpath=xpath=/html/body/div[3]/section[1]/div/div/div[1]/div[3]/div/div[2]/div/div[2]/div
${share}    xpath=//*[@id="dropdownMenuShare"]
${facebook}    xpath=/html/body/div[3]/div[1]/section[1]/div/div[1]/div[2]/div/div[1]/div/div/a[1]
${twitter}    xpath=/html/body/div[3]/div[1]/section[1]/div/div[1]/div[2]/div/div[1]/div/div/a[2]
#Kanchenjunga
${kanchenjunga_image}    xpath=/html/body/div[3]/section/div/div/div[3]/section/div/div/div/div[2]/div[2]
${kan_fav}    xpath=/html/body/div[3]/section/div/div/div[3]/section/div/div/div/div[2]/div[2]/div/div[1]/div/div[1]/div/button

${kan_nav}    xpath=/html/body/div[3]/nav
${kan_ele}    xpath=/html/body/div[3]/div[1]/section[2]
${kan_header}    xpath=/html/body/div[3]/nav

#Everest Via Gokyo
${eve_go_but}    xpath=/html/body/div[3]/section/div/div/div[3]/section/div/div/div/div[2]/div[3]
${gokyo_element}    xpath=/html/body/div[3]/div[1]/section[2]
${gokyo_header}    xpath=/html/body/div[3]/nav

#moderate
${moderate}    xpath=/html/body/div[3]/section/div/div/ul/li[2]
${annapurna_circuit}    xpath=/html/body/div[3]/section/div/div/div[4]/section/div/div/div/div[2]/div[1]/div
${manaslu_circuit}    xpath=/html/body/div[3]/section/div/div/div[4]/section/div/div/div/div[2]/div[2]
${manaslu_content}    xpath=/html/body/div[3]/div/section[1]/div/div[1]/div[1]/h1
${Annapurna_base_camp}    xpath=//*[@id="tab-moderate"]/section/div/div/div/div[2]/div[3]
${Annapurna_base_content}    xpath=/html/body/div[3]/div[1]/section[2]/div
${Everest_base_camp}    xpath=//*[@id="tab-moderate"]/section/div/div/div/div[2]/div[4]
${EBC_CONTENT}    xpath=/html/body/div[3]/div[1]/section[2]/div

#Challenging
${challenging}    xpath=/html/body/div[3]/section/div/div/ul/li[3]/h3
${mardi}    xpath=//*[@id="tab-challenging"]/section/div/div/div/div[2]/div[1]
${mardi_content}    xpath=/html/body/div[3]/div/section[1]/div/div[1]/div[1]/h1
${langtang}    xpath=//*[@id="tab-challenging"]/section/div/div/div/div[2]/div[2]
${langtang_content}    xpath=/html/body/div[3]/div[1]/section[2]
${poon_hill}    xpath=//*[@id="tab-challenging"]/section/div/div/div/div[2]/div[3]
${poon_hill_content}    xpath=/html/body/div[3]/div[1]/section[2]/div
${amayangri}    xpath=//*[@id="tab-challenging"]/section/div/div/div/div[2]/div[4]
${amayangri_content}    xpath=/html/body/div[3]/div[1]/section[2]/div









