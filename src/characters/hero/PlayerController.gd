extends KinematicBody2D

export (int) var speed = 2

var velocity : Vector2 = Vector2()
var can_move : bool = true

var equipped_tool : Tool

onready var directions : Dictionary = {
	"up" : Vector2(0, -1),
	"down" : Vector2(0, 1),
	"right" : Vector2(1, 0),
	"left" : Vector2(-1, 0)
}

var look_dir : Vector2


func _ready():
	get_equipped_tool()


func _physics_process(_delta):
	var _collider : KinematicCollision2D

	var prev_dir = look_dir

	if Input.is_action_pressed("ui_up"):
		look_dir = directions["up"]
		velocity.y = -speed
	elif Input.is_action_pressed("ui_down"):
		look_dir = directions["down"]
		velocity.y = speed
	else:
		velocity.y = 0

	if Input.is_action_pressed("ui_right"):
		look_dir = directions["right"]
		velocity.x = speed
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		look_dir = directions["left"]
		velocity.x = -speed
		$AnimatedSprite.flip_h = true
	else:
		velocity.x = 0

	if Input.is_action_just_pressed("ui_accept"):
		equipped_tool.use()


	if prev_dir != look_dir:
		flip_tool(look_dir)


	if can_move:
		_collider = move_and_collide(velocity)


func get_equipped_tool():
	equipped_tool = $Tool.get_child(0)


func flip_tool(direction : Vector2):
	var tool_offset = 8

	$Tool.position = direction * tool_offset

	if direction.x < 0:
		equipped_tool.get_node("AnimatedSprite").flip_h = true
	else:
		equipped_tool.get_node("AnimatedSprite").flip_h = false
