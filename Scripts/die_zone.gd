extends Area2D
@onready var timer: Timer = $Timer
@onready var die_sound: AudioStreamPlayer = $DieSound


func _on_body_entered(body: Node2D) -> void:
	print('检测到碰撞')
	#检测玩家进入死亡区
	if body.name == "Player" :
		print("you die")
		die_sound.play()
		# 玩家死亡时的操作
		body.velocity.y = -300
		body.set_collision_mask(0)
		body.set_collision_layer(0)
		#移除玩家碰撞体积
		body.get_node("CollisionShape2D").queue_free()
		
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)  # 隐藏鼠标光标
		body.is_died = true
		timer.start()


func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
