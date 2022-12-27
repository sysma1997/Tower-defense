extends StaticBody2D

signal take_damage(damage)
signal destroy

export var health: float = 50.0
export var max_ui_health: float = 39.0
var damage_ui_health: float

func _ready():
	pass

func _on_Sanctuary1_take_damage(damage):
	health -= damage
	
	if health == 0 or $ControlUI/Health.rect_size.x == 0:
		emit_signal("destroy")
		return
	
	damage_ui_health = $ControlUI/Health.rect_size.x / health
	
	$ControlUI/Health.rect_size.x -= damage_ui_health
