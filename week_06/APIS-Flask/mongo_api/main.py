from flask import Flask, request, jsonify
import markdown.extensions.fenced_code
import tools.getdata as get

app = Flask(__name__)


@app.route("/")
def index():
    readme_file = open("README.md", "r")
    md_template = markdown.markdown( readme_file.read(), extensions = ["fenced_code"]
    )
    return md_template



@app.route("/frases")
def frases():
    frase = get.primera_frase()
    return jsonify(frase)




app.run(debug=True)