#!/usr/bin/env python3
'''A module with tools for request caching and tracking.
'''
import time
import requests

# Dictionary to store cached content with expiration time
cache = {}

# Dictionary to track the number of times a URL is accessed
url_access_count = {}

def cache_decorator(func):
    def wrapper(url):
        # Check if the URL content is already cached and not expired
        if url in cache and time.time() < cache[url]["expires_at"]:
            print("Using cached content...")
            return cache[url]["content"]

        # Fetch the HTML content using requests
        response = requests.get(url)
        content = response.text

        # Cache the content with an expiration time of 10 seconds
        cache[url] = {
            "content": content,
            "expires_at": time.time() + 10
        }

        # Track the URL access count
        url_access_count[url] = url_access_count.get(url, 0) + 1

        return content

    return wrapper

@cache_decorator
def get_page(url):
    return requests.get(url).text

if __name__ == "__main__":
    # Test the get_page function with caching
    url = "http://slowwly.robertomurray.co.uk/delay/5000/url/http://www.example.com"
    for _ in range(5):
        print(get_page(url))

    # Check the URL access count
    print(url_access_count)

