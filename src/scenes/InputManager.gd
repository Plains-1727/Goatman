extends Node

onready var gui : CanvasLayer = $"/root/Main/GUI"


func _process(_delta):
	if Input.is_action_just_pressed("ui_inventory"):
		gui.load_element("inventory")
	
	if Input.is_action_just_pressed("ui_item_db_viewer"):
		gui.load_element("item_db_viewer")