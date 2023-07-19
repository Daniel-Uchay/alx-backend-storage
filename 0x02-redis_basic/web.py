import redis
import requests
from functools import wraps
from typing import Callable

redis_store = redis.Redis()

def data_cacher(method: Callable) -> Callable:
    @wraps(method)
    def invoker(url: str) -> str:
        # Check if the result is in the cache
        result = redis_store.get(f'result:{url}')
        if result is not None:
            # Increment the URL access count only if the result is found in the cache
            redis_store.incr(f'count:{url}')
            return result

        try:
            # Fetch the data using the provided method (e.g., get_page)
            data = method(url)
            # Cache the data with a timeout of 10 seconds
            redis_store.setex(f'result:{url}', 10, data)
            # Increment the URL access count as this is a fresh request
            redis_store.incr(f'count:{url}')
            return data
        except requests.RequestException:
            # Handle request errors gracefully, you can raise a custom exception or return an error message
            return f"Error: Unable to fetch data from {url}"
    
    return invoker

@data_cacher
def get_page(url: str) -> str:
    return requests.get(url).content

