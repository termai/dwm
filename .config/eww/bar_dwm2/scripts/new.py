#!/usr/bin/env python3
import os
import subprocess
import requests
from bs4 import BeautifulSoup

# Function to fetch the video thumbnail URL using the video title
def get_thumbnail_url(title):
    search_url = f'https://www.youtube.com/results?search_query={title}'
    response = requests.get(search_url)
    soup = BeautifulSoup(response.text, 'html.parser')
    
    # Find the first video link in search results
    video_link = soup.find('a', {'class': 'yt-uix-tile-link'})
    if video_link:
        video_url = 'https://www.youtube.com' + video_link['href']
        
        # Fetch the video page to extract thumbnail URL
        video_response = requests.get(video_url)
        video_soup = BeautifulSoup(video_response.text, 'html.parser')
        
        # Find the thumbnail URL
        thumbnail_url = video_soup.find('meta', {'property': 'og:image'})
        if thumbnail_url:
            return thumbnail_url['content']

    return None

# Get the video title from your media player (replace with your actual command)
title_cmd = 'playerctl metadata title'
title = subprocess.getoutput(title_cmd)

# Get the thumbnail URL using the modified function
thumbnail_url = get_thumbnail_url(title)

if thumbnail_url:
    # Create a notification using dunstify with the thumbnail
    os.system(f'dunstify -i "{thumbnail_url}" "Now Playing" "{title}"')
else:
    os.system(f'dunstify "Now Playing" "{title}"')
