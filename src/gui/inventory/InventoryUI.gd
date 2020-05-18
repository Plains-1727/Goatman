extends Control


onready var inventory : Inventory = $"/root/Main/Inventory"
onready var tree : Tree = $Tree

var tree_root


func _ready():
	hide()

	_initialize_tree()

	
func _initialize_tree() -> void:
	tree_root = tree.create_item()
	tree.set_hide_root(false)

	tree.set_column_title(0, "Ressource")
	tree.set_column_title(1, "Count")
	tree.set_column_titles_visible(true)


func display() -> void:
	if visible:
		hide()
	else:
		show()
		update()


func update() -> void:
	tree.clear()


	var ressources = inventory.ressources

	for ressource in ressources.keys():
		var ressource_name = ressource
		var count = ressources[ressource]

		print(ressource_name, count)

		var child = tree.create_item(tree_root)
		child.set_text(0, ressource_name)
		child.set_text(1, str(count))
