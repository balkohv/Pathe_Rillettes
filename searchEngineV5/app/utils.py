import requests
import logging
from functools import lru_cache

OMDB_API_KEY = '9a883ce3'

@lru_cache(maxsize=500)
def obtenir_informations_omdb(titre):
    OMDB_API_KEY = '9a883ce3'
    url = f"http://www.omdbapi.com/?t={titre}&apikey={OMDB_API_KEY}"
    response = requests.get(url)
    data = response.json()

    if data['Response'] == 'True':
        return {
            'title': data.get('Title'),
            'year': data.get('Year'),
            'rated': data.get('Rated'),
            'runtime': data.get('Runtime'),
            'genre': data.get('Genre'),
            'director': data.get('Director'),
            'plot': data.get('Plot'),
            'poster': data.get('Poster'),
            'metascore': data.get('Metascore'),
            'type': data.get('Type')
        }
    else:
        logging.error(f"Erreur lors de la récupération des informations pour le film {titre}")
        return None