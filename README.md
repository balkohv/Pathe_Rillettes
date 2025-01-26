	# étudiants
BESSIER Jason - PELLEFIGUE Théo
Non-alternants
   


   # Build
docker compose -f searchEngineV5/config/docker-compose.yml up --build

    # Local flask app for tests purposes
$env:FLASK_APP = "app"
$env:FLASK_ENV = "development"  # Optionnel : active le mode développement
flask run


    # API répertoriant les films/séries et leurs infos
https://www.omdbapi.com/

omdbapi key : 9a883ce3
link exemple : http://www.omdbapi.com/?i=tt3896198&apikey=9a883ce3