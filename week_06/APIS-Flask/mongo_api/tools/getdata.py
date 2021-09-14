from config.configuration import db,c


def primera_frase():
    query = {"character_name": "Minerva McGonagall"}
    frases = list(c.find(query, {"_id": 0}))
    return frases
