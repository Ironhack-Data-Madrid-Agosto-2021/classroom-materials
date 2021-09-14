from flask import Flask, request
from flask.json import jsonify
import tools.datos as dat
import tools.paraeldado as da
import random
import json

app = Flask(__name__)



@app.route("/")
def index():
    return "Hola Mundo"

@app.route("/refran")
def loquesea():
    refran = dat.refranes()
    return refran


@app.route("/dado")
def dado():
    return jsonify(f"{da.tiraeldado()}")


@app.route("/refrantuneado")
def refrantuning():
    # parámetros entre paréntesis no obligatorios
    lan = request.args.get('idioma')
    # Parámetro entre corchetes, obligatorio (required) si no está, la api devuelve error 400
    frase = request.args['frase']
    refran = dat.refranes_2(lan)
    diccionario = {"key": frase, "refrán": refran}
    return diccionario


@app.route("/prueba")
def hola():
    pepe = {"qué pasa": 3, "elmadrileño": "larosalía"}
    return jsonify(pepe)



if __name__ == '__main__':
    app.run(debug=True)