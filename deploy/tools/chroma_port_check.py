import chromadb
from chromadb.config import Settings
from chromadb.client import Client

settings = Settings(chromadb_url="http://0.0.0.0:8000")
client = Client(settings=settings)

# Query ChromaDB
collections = client.list_collections()
print(collections)
