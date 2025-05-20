extends Node2D

@export var direction :int = 1
const SPEED = 60
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_right: RayCast2D = $RayCastRight
# 新增地面检测射线
@onready var ray_cast_ground: RayCast2D = $RayCastGround  
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _process(delta: float) -> void:
	if ray_cast_left.is_colliding() or ray_cast_right.is_colliding() or not ray_cast_ground.is_colliding():
		#碰撞则改变方向
		direction *= -1
	if direction == 1:
		animated_sprite_2d.flip_h = false
	else:
		#翻转
		animated_sprite_2d.flip_h = true
	position.x += SPEED * delta * direction
	
	
