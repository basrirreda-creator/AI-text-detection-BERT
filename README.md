# AI Text Detection with BERT

🤖 Détection de textes générés par IA vs textes humains

## 📊 Statistiques

- **89.3%** d'accuracy
- **500,000+** textes d'entraînement
- **8** modèles IA testés
- **5** classes de classification
- **BERT fine-tuning** appliqué
- **SHAP explainability** intégré

## 🎯 Objectif

Différencier les textes générés par:
- **Human** (Texte humain)
- **GPT-3.5** (OpenAI)
- **GPT-4** (OpenAI)
- **Claude** (Anthropic)
- **Gemini** (Google)




## 🚀 Installation

```bash
git clone https://github.com/reda-basrir/ai-text-detection-bert.git
cd ai-text-detection-bert

python -m venv venv
source venv/bin/activate
pip install -r requirements.txt

cp .env.example .env
