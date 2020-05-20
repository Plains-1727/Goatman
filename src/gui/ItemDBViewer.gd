extends Control

onready var tree : Tree = $Tree
onready var item_db = DataLoader.item_db


func _ready():
	hide()

	tree.set_hide_root(true)
	tree.set_column_titles_visible(true)
	tree.select_mode = 1
	tree.columns = 7

	tree.set_column_title(0, "Name")
	tree.set_column_title(1, "Type")
	tree.set_column_title(2, "Icon")
	tree.set_column_title(3, "Damage")
	tree.set_column_title(4, "Protection")
	tree.set_column_title(5, "Slot")
	tree.set_column_title(6, "Effect")

	var root = tree.create_item()

	for key in item_db:
		var item = item_db[key]
		var name = item.item_name
		var type = item.item_type
		var icon : Texture = load(item.item_icon)
		var damage = item.item_damage
		var protection = item.item_protection
		var slot = item.item_slot
		var effect = item.item_effect

		var child = tree.create_item(root)
		child.set_text(0, name)
		child.set_text(1, type)
		child.set_icon(2, icon)
		child.set_icon_max_width(2, 4)
		child.set_text(3, damage)
		child.set_text(4, protection)
		child.set_text(5, slot)
		child.set_text(6, effect)

		


func display():
	if !visible:
		show()
	else:
		hide()
