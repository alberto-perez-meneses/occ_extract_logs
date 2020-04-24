import json
f= open("response/ccstore.log.prd.json","r")
parsed_json = (json.loads(f.read()))
#print (parsed_json["items"])


for x in parsed_json["items"]:
	print x

