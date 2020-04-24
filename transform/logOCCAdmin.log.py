import json

source= "response/ccadmin.log.prd.json"
f= open(source,"r")
parsed_json = (json.loads(f.read()))
#print (parsed_json["items"])

for store in xrange(1,20):
	item= "store" + str(store)
	#print item
	try:
		for x in parsed_json[item]:
			print [x ,item]
	except Exception as e:
		#raise e
		pass
	