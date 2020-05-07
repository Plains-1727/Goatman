extends Area2D

class_name Tool

export (int) var damage = 50


func use() -> void:
	$AnimationPlayer.play("Use")


func _on_body_entered(body):
	body.take_damage(damage)