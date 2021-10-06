import os
from typing import Collection
import dotenv
from pymongo import MongoClient

dotenv.load_dotenv()

dburl = os.getenv("URL")

print(dburl)
if not dburl:
    raise ValueError("No tienes URL de mongodb")


client = MongoClient(dburl)
db = client.get_database()
c = db["frases"]


