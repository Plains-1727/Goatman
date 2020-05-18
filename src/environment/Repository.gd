extends StaticBody2D

class_name Repository

export (PackedScene) var ressource

var health : int = 100

var is_depleted : bool = false


func _ready():
	$AnimatedSprite.frame = 0


func take_damage(damage : int) -> void:
	health -= damage

	if health <= 0 and !is_depleted:
		die()		


func die() -> void:
	is_depleted = true

	$AnimatedSprite.frame = 1

	var drop = ressource.instance()
	drop.position = position + Vector2(0, 32)

	get_node("/root/Main").call_deferred("add_child", drop)
