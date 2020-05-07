extends Area2D

class_name Tool


func use():
	$AnimationPlayer.play("Use")


func _on_body_entered(body):
	print("hit: " + body.name)