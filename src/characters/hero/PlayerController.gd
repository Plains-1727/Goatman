extends KinematicBody2D

export (int) var speed = 100

var velocity : Vector2 = Vector2()
var can_move : bool = true

var equipped_tool : Tool

onready var directions : Dictionary = {
	"up" : Vector2.UP,
	"down" : Vector2.DOWN,
	"right" : Vector2.RIGHT,
	"left" : Vector2.LEFT
}

var look_dir : Vector2


func _ready():
	get_equipped_tool()


func _physics_process(_delta):
	var _collider : KinematicCollision2D
	var is_moving : bool = false

	var prev_dir = look_dir

	if Input.is_action_pressed("ui_up"):
		look_dir = directions["up"]
		velocity.y = -speed
		is_moving = true
	elif Input.is_action_pressed("ui_down"):
		look_dir = directions["down"]
		velocity.y = speed
		is_moving = true
	else:
		velocity.y = 0

	if Input.is_action_pressed("ui_right"):
		look_dir = directions["right"]
		velocity.x = speed
		is_moving = true
	elif Input.is_action_pressed("ui_left"):
		look_dir = directions["left"]
		velocity.x = -speed
		is_moving = true
	else:
		velocity.x = 0

	if Input.is_action_just_pressed("ui_accept"):
		equipped_tool.use()


	if prev_dir != look_dir:
		flip_tool(look_dir)


	if can_move:
		velocity = move_and_slide(velocity)

	play_animation(is_moving, look_dir)


func get_equipped_tool() -> void:
	equipped_tool = $Tool.get_child(0)


func flip_tool(direction : Vector2) -> void:
	var tool_offset = 8

	$Tool.position = direction * tool_offset

	if direction.x < 0:
		equipped_tool.get_node("AnimatedSprite").flip_h = true
	else:
		equipped_tool.get_node("AnimatedSprite").flip_h = false


func play_animation(is_moving : bool, direction : Vector2) -> void:
	match direction:
		Vector2.UP:
			if is_moving:
				$AnimatedSprite.play("walk_up")
			else:
				$AnimatedSprite.play("idle_up")
		Vector2.DOWN:
			if is_moving:
				$AnimatedSprite.play("walk_down")
			else:
				$AnimatedSprite.play("idle_down")
		Vector2.LEFT:
			if is_moving:
				$AnimatedSprite.play("walk_left")
			else:
				$AnimatedSprite.play("idle_left")
		Vector2.RIGHT:
			if is_moving:
				$AnimatedSprite.play("walk_right")
			else:
				$AnimatedSprite.play("idle_right")
