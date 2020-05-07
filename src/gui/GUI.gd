extends CanvasLayer

class_name GUI

var inventory : Node


func _ready():
	inventory = get_node("/root/Main/Inventory")


func update_gui():
	$label_wood.text = str(inventory.ressources["Wood"])
