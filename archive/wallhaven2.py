import os
import requests
from bs4 import BeautifulSoup

# Define the base URL without the page number
base_url = "https://wallhaven.cc/search?q=anime%20-girl&categories=110&purity=100&sorting=relevance&order=desc&page="

# Define the range of page numbers you want to download (1 to 8)
for page_num in range(1, 9):
    page_url = base_url + str(page_num)
    
    page = requests.get(page_url)
    parse_html = BeautifulSoup(page.content, "html.parser")

    img_url = parse_html.find_all("img", class_="lazyload")

    with open('imageslist.txt', 'w') as f:
        for url in img_url:
            url_list = list(url['data-src'])
            url_list[24:32] = 'full'
            url_list[27:29] = "l/wallhaven-"
            url_list[8:10] = "w"
            start_of_file = url_list[38:40]
            one_join = ''.join(start_of_file)
            url_list[23:28] = f"full/{one_join}/"
            str_list = ''.join(url_list)
            f.write("%s\n" % str_list)

    # Use a download loop to fetch the images from imageslist.txt
    make_file = os.system("while read url; do axel $url -q -o ~/wallpapers/; done < ~/imageslist.txt")
    print(make_file)
