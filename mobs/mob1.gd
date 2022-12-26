extends KinematicBody2D

signal set_target(target)

var agent: NavigationAgent2D

var velocity: Vector2 = Vector2.ZERO
var speed: int = 6000

var is_attack: bool = false
var sanctuary_target_attack: Node2D

func _ready():
	agent = $NavigationAgent2D

func _physics_process(delta):
	var direction = position.direction_to(agent.get_next_location())
	
	var desired_velocity = direction * speed
	var steering = (desired_velocity - velocity) * delta
	velocity = steering
	
	velocity = move_and_slide(velocity)

func set_target(target: Vector2):
	agent.set_target_location(target)

func start_position(position: Vector2):
	global_position = position


func _on_Damage_range_body_entered(body: Node2D):
	var name = body.name.to_lower()
	if name.find_last("sanctuary") >= 0:
		sanctuary_target_attack = body
		is_attack = true
func _on_Damage_range_body_exited(body):
	var name = body.name.to_lower()
	if name.find_last("sanctuary") >= 0:
		is_attack = false
		sanctuary_target_attack = null

func _on_Timer_timeout():
	if !is_attack:
		return
	
	sanctuary_target_attack.emit_signal("take_damage", 1)
