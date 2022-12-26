extends Node2D

var camera_position: Vector2
var last_camera_position: Vector2
var moving_force: int = 0

func _ready():
	pass

func _physics_process(delta):
	if camera_position == null or camera_position == Vector2.ZERO:
		return
	
	$Camera.transform.origin += camera_position * moving_force * delta
	var origin = $Camera.transform.origin
	origin.y = clamp(origin.y, 0, 680)
	$Camera.transform.origin = origin
	
	camera_position = Vector2.ZERO

func _input(event):
	if event is InputEventScreenTouch and event.is_pressed():
		last_camera_position = Vector2(0, -event.position.y)
	if event is InputEventScreenDrag:
		var position = Vector2(0, -event.position.y)
		camera_position = position - last_camera_position
		moving_force = clamp(abs(position.y - last_camera_position.y), 30, 100)
		
		last_camera_position = position


func _on_Timer_timeout():
	if $Map1.get_mobs_sizes() >= 5:
		return
	
	$Map1.emit_signal("generate_mobs", 1)
