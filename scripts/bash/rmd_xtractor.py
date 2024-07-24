#!/usr/bin/env python3
import base64
import os
import sys
from bs4 import BeautifulSoup

def extract_images(html_file):
    # Create a directory with the same name as the html file
    output_dir = os.path.splitext(html_file)[0]
    os.makedirs(output_dir, exist_ok=True)

    # Load the HTML file
    with open(html_file, 'r') as f:
        html = f.read()

    soup = BeautifulSoup(html, 'html.parser')

    # Find all iframe tags with a data URL
    for i, iframe in enumerate(soup.find_all('iframe')):
        data_url = iframe['src']
        if not data_url.startswith('data:'):
            continue

        # Split the data URL into the metadata and the data
        metadata, data = data_url.split(',')

        # Determine the file extension (default to pdf)
        ext = 'pdf'

        # Decode the Base64 data
        data = base64.b64decode(data)

        # Write the data to a file
        with open(os.path.join(output_dir, f'file{i}.{ext}'), 'wb') as f:
            f.write(data)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print(f"Usage: {sys.argv[0]} <html_file>")
        sys.exit(1)

    extract_images(sys.argv[1])