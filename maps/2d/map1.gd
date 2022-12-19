extends Node2D

signal generate_mobs(length)

var mobScene: PackedScene

func _ready():
	mobScene = ResourceLoader.load("res://mobs/mob1.tscn") as PackedScene

func _on_Map1_generate_mobs(length):
	for i in length:
		var mob = mobScene.instance()
		
		mob._ready()
		mob.start_position($Navegation/GeneratorMobs.position)
		mob.set_target($Navegation/Sanctuaries/Sanctuary1.position)
		
		$Navegation/Mobs.add_child(mob)
