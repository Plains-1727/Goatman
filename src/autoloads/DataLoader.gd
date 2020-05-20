extends Node

var item_data_path : String = "res://data/item_data.json"
var item_db


func _ready():
	var item_data_file = File.new()
	item_data_file.open(item_data_path, File.READ)

	var item_data_json = JSON.parse(item_data_file.get_as_text())
	item_data_file.close()

	item_db = item_data_json.result