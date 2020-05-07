extends Node

class_name Inventory

var gui : GUI

var ressources : Dictionary = {
	"Wood" : 0
}


func _ready():
	gui = get_node("/root/Main/GUI")


func add_ressource(ressource : String, amount : int):
	ressources[ressource] = ressources[ressource] + amount

	gui.update_gui()
