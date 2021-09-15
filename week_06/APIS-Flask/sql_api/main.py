from flask import Flask, request
from flask import json
from flask.json import jsonify, load
from numpy import character
from sqlalchemy.util.langhelpers import method_is_overridden
import tools.sql_tools as sql

app = Flask(__name__)



@app.route("/")
def inicio():
    return "Hola Mundo"



@app.route("/frases/<name>")
def frasespersonaje(name):
    print(name)
    frases = sql.mensajespersonaje(name)
    return frases



@app.route("/nuevafrase", methods=["POST"])
def nuevafrase():
    scene = request.form.get("escena")
    dialogue = request.form.get("frase")
    character = request.form.get("personaje")

    return sql.insertamensaje(scene,character,dialogue)



app.run(debug=True)