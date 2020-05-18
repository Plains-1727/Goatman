extends Area2D

class_name Ressource

export (String) var ressource = ""
export (int) var value = 0

var inventory : Node


func _ready():
	inventory = get_node("/root/Main/Inventory")

func _on_body_entered(body):
	inventory.add_ressource(ressource, value)
	queue_free()
