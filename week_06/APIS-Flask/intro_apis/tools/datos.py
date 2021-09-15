import random
from re import T
from googletrans import Translator

def refranes():
    lista = ["Al buen día, ábrele la puerta.", "Amores nuevos, casa con pucheros.", "Invierno lluvioso, verano abundoso."]
    return random.choice(lista)

def refranes_2(lan):
    trans = Translator()
    lista = ["Al buen día, ábrele la puerta.", "Amores nuevos, casa con pucheros.", "Invierno lluvioso, verano abundoso."]
    if lan == "en":
        return f"{trans.translate(random.choice(lista), dest='en').text}"
    else:
        return random.choice(lista)

