from config.configuration import db,c


def todas_frases():
    query = {"character_name": "Minerva McGonagall"}
    frases = list(c.find(query, {"_id": 0}))
    return frases

def una_frase():
    return c.find_one({},{"_id": 0})


def insertamensaje(diccionario):
    c.insert_one(diccionario)
    return f"Se han introducido correctamente los siguientes datos {diccionario}"