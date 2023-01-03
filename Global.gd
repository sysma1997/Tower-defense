extends Node

var current_scene: Node = null

func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)

func goto_scene(path: String):
	call_deferred("deferred_goto_scene", path)

func deferred_goto_scene(path: String):
	current_scene.free()
	
	var scene = ResourceLoader.load(path)
	current_scene = scene.instance()
	
	get_tree().get_root().add_child(current_scene)
	get_tree().set_current_scene(current_scene)
