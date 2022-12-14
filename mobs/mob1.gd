extends KinematicBody2D

signal change_direction(new_direction)

var speed: int = 10
var isRight: bool = false

var direction: String = "down"

func _ready():
	pass

func _physics_process(delta):
	var vector = Vector2.ZERO
	if direction == "down":
		vector = Vector2.DOWN
	elif direction == "left":
		vector = Vector2.LEFT
	elif direction == "right":
		vector = Vector2.RIGHT
	elif direction == "up":
		vector = Vector2.UP
	
	move_and_collide(vector * speed * delta)

func _on_Mob1_change_direction(new_direction: String):
	direction = new_direction
