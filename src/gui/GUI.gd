extends CanvasLayer

class_name GUI

onready var inventory : Node

onready var ui_elements : Dictionary = {
	"inventory" : $InventoryUI
}


func _ready():
	inventory = get_node("/root/Main/Inventory")


func update_gui() -> void:
	$label_wood.text = str(inventory.ressources["Wood"])


func load_element(element : String) -> void:
	print(ui_elements[element])
	ui_elements[element].display()
