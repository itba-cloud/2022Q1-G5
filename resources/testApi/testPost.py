import base64
import requests
import json

filepath = "../mot.mp3"
with open(filepath, 'rb') as f:
    audio_encoded = base64.b64encode(f.read())  # read file into RAM and encode it

data = {
    "content": str(audio_encoded),  # base64 string
    "sampleRate": 8000, 
    "encoding": "FLAC",  # maybe "MP3" should be there?
    "languageCode": "en-US", 
    "speakerId": "Pranshu Ranjan",
}

app_json = json.dumps(data)
print(app_json)

url = "https://zmci27sxbk.execute-api.us-east-1.amazonaws.com/production/resource"
r = requests.post(url, json=data)  # note json= here. Headers will be set automatically.
#print(r)