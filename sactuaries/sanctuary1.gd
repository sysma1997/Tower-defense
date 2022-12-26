extends StaticBody2D

signal take_damage(damage)
signal destroy

export var health: int

func _ready():
	health = 50

func _on_Sanctuary1_take_damage(damage):
	health -= damage
	if health <= 0:
		emit_signal("destroy")
	
	print(health)
