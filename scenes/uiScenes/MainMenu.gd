extends Control

func _on_NewGame_pressed():
	Global.goto_scene("res://scenes/mainScenes/GameScene.tscn")

func _on_Settings_pressed():
	pass

func _on_About_pressed():
	pass

func _on_Quit_pressed():
	get_tree().quit()
