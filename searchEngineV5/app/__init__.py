import logging
from flask import Flask
from flask_cors import CORS  # Pour permettre les requêtes depuis un serveur web
from app.routes import init_routes
from app.tfidf_handler import initialiser_tfidf

logging.basicConfig(level=logging.INFO)

app = Flask(__name__)
CORS(app)  # Active CORS pour permettre les requêtes depuis un autre domaine

tfidf_data = initialiser_tfidf()
init_routes(app, tfidf_data)

if __name__ == "__main__":
    logging.info("Lancement de l'API Flask")
    app.run(debug=True, host="0.0.0.0", port=5000)