from config.configuration import engine
import pandas as pd

def mensajespersonaje(personaje):
    query = f"""
SELECT * FROM frases
WHERE character_name = '{personaje}'
"""
    datos = pd.read_sql_query(query,engine)

    return datos.to_json(orient="records")



def insertamensaje(escena,personaje,frase):
    engine.execute(f"""
    INSERT INTO frases (scene,character_name,dialogue)
    VALUES ({escena}, '{personaje}', '{frase}');
    """)

    return f"Se ha introducido correctamente: {escena},{personaje},{frase}"

