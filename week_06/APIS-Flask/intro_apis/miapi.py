from flask import Flask, request
from tools.paraeldado import eldado 
import tools.datos as dat



app = Flask(__name__)


@app.route("/")
def index():
    return "Hola mundo"


@app.route("/datos")
def datos():
    return dat.datos_pepe()



@app.route("/dado")
def dado():
    return eldado()


@app.route('/ejemplo')
def query_example():
    # if key doesn't exist, returns None
    language = request.args.get('language')
    # if key doesn't exist, returns a 400, bad request error
    frase = request.args['frase']
    refran = dat.frase_random(language)
    diccionario = {"key": frase, "refrán": refran}
    return diccionario









app.run("0.0.0.0",5000, debug=True)
 