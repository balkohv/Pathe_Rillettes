import logging
from flask import request, jsonify, Blueprint, current_app
from app.search import rechercher_series

bp = Blueprint('routes', __name__)

def init_routes(app, tfidf_data):
    app.register_blueprint(bp)
    app.config['TFIDF_DATA'] = tfidf_data

@bp.route('/')
def index():
    return jsonify({"message": "Bienvenue sur l'API de recherche de séries"}), 200

@bp.route('/recherche', methods=['POST'])
def recherche():
    data = request.get_json()  # Récupérer les données JSON envoyées
    requete = data.get('requete', '')

    if not requete:
        return jsonify({"error": "Aucune requête fournie"}), 400

    tfidf_matrix, termes, vectorizer, titres_series = current_app.config['TFIDF_DATA']
    
    logging.info(f"Recherche des séries pour : '{requete}'...")

    series_trouvees = rechercher_series(requete, tfidf_matrix, vectorizer, titres_series, top_n=10, seuil=0.002)

    if not series_trouvees:
        logging.warning(f"Aucune série trouvée pour '{requete}'")
        return jsonify({"message": "Aucun résultat trouvé"}), 404

    return jsonify({"resultats": series_trouvees}), 200