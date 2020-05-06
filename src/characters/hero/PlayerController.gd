extends KinematicBody2D

export (int) var speed = 2

var velocity : Vector2 = Vector2()
var can_move : bool = true


func _physics_process(_delta):
	var _collider : KinematicCollision2D

	if Input.is_action_pressed("ui_up"):
		velocity.y = -speed
	elif Input.is_action_pressed("ui_down"):
		velocity.y = speed
	else:
		velocity.y = 0

	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
		$AnimatedSprite.flip_h = true
	else:
		velocity.x = 0


	if can_move:
		_collider = move_and_collide(velocity)