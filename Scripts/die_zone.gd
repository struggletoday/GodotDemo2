extends Area2D
@onready var timer: Timer = $Timer
@onready var die_sound: AudioStreamPlayer = $DieSound

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		print("enemy died zone")
		var game_manager = get_node("/root/World/GameManager")
		var result = game_manager.edit_health()
		if result:
			print("player die")
			die_sound.play()
			# 玩家死亡时的操作
			body.velocity.y = -300
			body.set_collision_mask(0)
			body.set_collision_layer(0)
			#移除玩家碰撞体积
			body.get_node("CollisionShape2D").queue_free()
			# 隐藏鼠标光标
			#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
			timer.start()

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
