extends KinematicBody2D

signal set_target(target)

var agent: NavigationAgent2D

var velocity: Vector2 = Vector2.ZERO
var speed: int = 1000

func _ready():
	agent = $NavigationAgent2D

func _physics_process(delta):
	var direction = position.direction_to(agent.get_next_location())
	
	var desired_velocity = direction * speed
	var steering = (desired_velocity - velocity) * delta
	velocity = steering
	
	velocity = move_and_slide(velocity)

func _on_Mob1_set_target(target: Vector2):
	agent.set_target_location(target)
