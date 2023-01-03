extends CanvasLayer

func set_tower_preview(tower_type: String, mouse_position: Vector2):
	var drag_tower = load("res://scenes/turrets/" + tower_type + ".tscn").instance()
	drag_tower.set_name("DragTower")
	drag_tower.modulate = Color("ad54ff3c")
	
	var tower_preview = Control.new()
	tower_preview.add_child(drag_tower, true)
	tower_preview.rect_position = mouse_position
	tower_preview.set_name("TowerPreview")
	add_child(tower_preview, true)
	move_child(tower_preview, 0)

func update_tower_preview(new_position: Vector2, color: String):
	var tower_preview: Control = get_node("TowerPreview")
	var drag_tower: Node2D = tower_preview.get_node("DragTower")
	
	tower_preview.rect_position = new_position
	if drag_tower.modulate != Color(color):
		drag_tower.modulate = Color(color)
