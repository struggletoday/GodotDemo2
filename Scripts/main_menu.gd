extends Node
const GameManager = preload("res://Scripts/game_manager.gd")

func _on_btn_level_1_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Level1.tscn")


func _on_btn_level_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Level2.tscn")
