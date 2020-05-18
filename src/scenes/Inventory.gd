extends Node

class_name Inventory

signal update

var gui : GUI

var ressources : Dictionary = {
	"Wood" : 0,
	"Stone" : 0
}


func _ready():
	gui = get_node("/root/Main/GUI")


func add_ressource(ressource : String, amount : int):
	ressources[ressource] = ressources[ressource] + amount

	emit_signal("update")
	#gui.update_gui()