extends Node
# Dictionary to hold the loaded JSON data
var itemData = {}
# Path to the JSON file
var data_file_path = "res://json/onepiece.json"

func _ready():
	# Load the JSON data when the scene is ready
	itemData=load_json_file(data_file_path)


func load_json_file(filePath:String):
	# Check if the file exists at the given path
	if FileAccess.file_exists(filePath):
		# Open the file in read mode
		var dataFile= FileAccess.open(filePath,FileAccess.READ)
		# Parse the file content as JSON
		var parsedResult = JSON.parse_string(dataFile.get_as_text())
		# Check if the parsed result is a dictionary
		if parsedResult is Dictionary:
			# Return the dictionary
			return parsedResult
		else:
			# Print error if parsing failed
			print("error leyendo")
		
	else:
		# Print error if the file does not exist
		print("no esta el archivo!!")
