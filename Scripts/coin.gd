extends Area2D
@onready var game_manager: Node = %GameManager
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _on_body_entered(body: Node2D) -> void:
	#判断碰撞的物体
	if body.name == "Player" :
		game_manager.add_score()
		#金币飘字场景
		var float_text = preload("res://Scenes/float_text.tscn").instantiate()
		#添加到指定节点
		get_node("/root/World/Player").add_child(float_text)
		float_text.global_position = global_position + Vector2(-30, -40)
		animation_player.play("new_animation")
