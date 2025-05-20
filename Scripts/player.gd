extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 250.0
const JUMP_VELOCITY = -450.0
var max_jumps = 2
# 标记是否死亡
var is_died = false
# 当前可用跳跃次数
var available_jumps = max_jumps

func _physics_process(delta: float) -> void:
	#玩家死亡
	if is_died:
		velocity.x=0
		velocity += get_gravity() * delta
		move_and_slide()
		return
	# 不在地面时的操作
	if not is_on_floor():
		velocity += get_gravity() * delta
	else :
		#重置跳跃次数
		available_jumps = max_jumps
	# 按下跳跃键
	if Input.is_action_just_pressed("jump") and available_jumps>0 :
		velocity.y = JUMP_VELOCITY
		available_jumps -= 1
		#播放跳跃动画
		animated_sprite_2d.play("jump")
		
	# 获取方向
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		if direction == 1:
			animated_sprite_2d.flip_h=false
		else:
			#翻转人物
			animated_sprite_2d.flip_h=true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if is_on_floor() and direction==0:
		animated_sprite_2d.play("idle")
	elif is_on_floor():
		animated_sprite_2d.play("run")

	move_and_slide()
