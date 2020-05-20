extends CanvasLayer

class_name GUI

onready var ui_elements : Dictionary = {
	"inventory" : $InventoryUI,
	"item_db_viewer" : $ItemDBViewer
}


func load_element(element : String) -> void:
	ui_elements[element].display()