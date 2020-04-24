import json
f= open("response/token.prd.json","r")
#if f.mode == 'r':
#contents =f.read()
#leer archivo de token
response=json.loads(f.read())

print(response["access_token"])

f.close() 
