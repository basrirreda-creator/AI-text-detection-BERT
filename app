"""
API REST Flask
"""

from flask import Flask, request, jsonify
from flask_cors import CORS
import logging
from src.inference import TextDetector

app = Flask(__name__)
CORS(app)

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# Charger le modèle
detector = TextDetector("models/bert_model.pt")

@app.route('/api/predict', methods=['POST'])
def predict():
    """Endpoint de prédiction"""
    try:
        data = request.get_json()
        text = data.get('text')
        
        if not text:
            return jsonify({'error': 'No text provided'}), 400
        
        prediction = detector.predict(text)
        
        return jsonify({
            'success': True,
            'prediction': prediction
        })
    
    except Exception as e:
        logger.error(f"Error: {str(e)}")
        return jsonify({'error': str(e)}), 500

@app.route('/api/health', methods=['GET'])
def health():
    """Health check"""
    return jsonify({'status': 'OK', 'service': 'AI Text Detection API'})

@app.route('/api/info', methods=['GET'])
def info():
    """Info sur le service"""
    return jsonify({
        'name': 'AI Text Detection API',
        'version': '1.0.0',
        'models': ['Human', 'GPT-3.5', 'GPT-4', 'Claude', 'Gemini'],
        'accuracy': '89.3%'
    })

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
