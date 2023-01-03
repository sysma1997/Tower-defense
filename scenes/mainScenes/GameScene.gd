extends Node2D

var map_node: Node2D

var build_mode: bool = false
var build_valid: bool = false
var build_location
var build_type

func _ready():
	map_node = $Map1
	
	for button in get_tree().get_nodes_in_group("build_buttons"):
		button.connect("pressed", self, "initiate_build_mode", [button.get_name()])

func _process(delta):
	if build_mode:
		update_tower_preview()

func _unhandled_input(event):
	if event.is_action_pressed("ui_accept") and build_mode:
		verify_and_build()
		cancel_build_mode()
	if event.is_action_pressed("ui_cancel") and build_mode:
		cancel_build_mode()

func initiate_build_mode(tower_type):
	build_type = tower_type + "T1"
	build_mode = true
	
	$UI.set_tower_preview(build_type, get_global_mouse_position())

func update_tower_preview():
	var mouse_position: Vector2 = get_global_mouse_position()
	var current_tile = $Map1/TowerExclusion.world_to_map(mouse_position)
	var tile_position = $Map1/TowerExclusion.map_to_world(current_tile)
	
	if $Map1/TowerExclusion.get_cellv(current_tile) == -1:
		$UI.update_tower_preview(tile_position, "ad54ff3c")
		build_valid = true
		build_location = tile_position
	else:
		$UI.update_tower_preview(tile_position, "adff4545")
		build_valid = false

func cancel_build_mode():
	var tower_preview = get_node("UI/TowerPreview")
	
	build_mode = false
	build_valid = false
	tower_preview.queue_free()

func verify_and_build():
	if !build_valid:
		return
	
	var new_tower: Node2D = load("res://scenes/turrets/" + build_type + ".tscn").instance()
	new_tower.position = build_location
	$Map1/Turrets.add_child(new_tower, true)
