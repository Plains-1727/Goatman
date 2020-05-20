extends MarginContainer

export (Texture) var axe_icon
export (Texture) var pickaxe_icon

onready var item_list = $ItemList



func _ready():
	item_list.add_item("", axe_icon)
	item_list.add_item("", pickaxe_icon)
