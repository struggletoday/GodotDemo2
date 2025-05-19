extends Area2D
@export var target_level : PackedScene

func _on_body_entered(body: Node2D) -> void:
	print(body.name)
	#检测是玩家就进入下一关
	if body.name == "Player":
		#跳转到指定场景
		get_tree().change_scene_to_packed(target_level)
