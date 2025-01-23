from chromadb.api.types import Documents, EmbeddingFunction, Embeddings
from langchain.embeddings import HuggingFaceEmbeddings
import logging

logging.basicConfig(level=logging.DEBUG)
logger = logging.getLogger(__name__)

class ChromaHuggingFaceEmbeddings(EmbeddingFunction):
    def __init__(self, **kwargs):
        logger.debug(f"Initializing with kwargs: {kwargs}")
        self.model = HuggingFaceEmbeddings(**kwargs)
        
    def embed_documents(self, texts):
        return self.model.embed_documents(texts)

    def embed_query(self, text):
        return self.model.embed_query(text)

    def __call__(self, input):  # Note: explicitly only taking 'input' parameter
        logger.debug(f"__call__ with input type: {type(input)}")
        if isinstance(input, str):
            return self.embed_query(input)
        return self.embed_documents(input)