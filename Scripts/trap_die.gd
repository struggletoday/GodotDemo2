extends Area2D
@onready var die_sound: AudioStreamPlayer = $DieSound
@onready var game_manager: Node = %GameManager
@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		print("trap died zone")
		game_manager.died()
		die_sound.play()
		# 玩家死亡时的操作
		body.velocity.y = -300
		body.set_collision_mask(0)
		body.set_collision_layer(0)
		#移除玩家碰撞体积
		body.get_node("CollisionShape2D").queue_free()
		timer.start()


func _on_timer_timeout() -> void:
	print("reload game scene")
	get_tree().reload_current_scene()
