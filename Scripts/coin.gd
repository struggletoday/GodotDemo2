extends Area2D
@onready var game_manager: Node = %GameManager
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _on_body_entered(body: Node2D) -> void:
	#判断碰撞的物体
	if body.name == "Player" :
		game_manager.add_score()
		animation_player.play("new_animation")
