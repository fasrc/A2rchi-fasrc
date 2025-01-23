import os
import openai

openai.api_key = os.getenv("OPENAI_API_KEY")
try:
    response = openai.Engine.list()
    print("API is working:", response)
except Exception as e:
    print("Error:", e)
