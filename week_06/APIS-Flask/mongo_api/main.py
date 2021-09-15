from flask import Flask, request, jsonify
import markdown.extensions.fenced_code
import tools.mongo_tools as mongo

app = Flask(__name__)


@app.route("/")
def index():
    readme_file = open("README.md", "r")
    md_template = markdown.markdown( readme_file.read(), extensions = ["fenced_code"]
    )
    return md_template



@app.route("/frases")
def frases():
    frase = mongo.todas_frases()
    return jsonify(frase)


@app.route("/prueba")
def probando():
    frase = mongo.una_frase()
    print(frase)
    return frase


@app.route("/nuevafrase", methods=["POST"])
def insertamensaje():
    diccionario = { "scene": request.form.get("escena"), 
    "character_name": request.form.get("personaje"),
    "dialogue": request.form.get("frase")
    }
    # Podríamos llamar a las funciones check
    
    return mongo.insertamensaje(diccionario)







app.run(debug=True)