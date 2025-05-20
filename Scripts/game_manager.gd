extends Node
#管理全局使用的变量
@onready var coins_total: Label = $"../TopStatusBar/Panel/Coins"
@onready var tile_map_layer: TileMapLayer = $"../TileMapLayer"
@onready var camera_2d: Camera2D = $"../Player/Camera2D"
@onready var health_label: Label = $"../TopStatusBar/Panel/Health"

var score :int = 0
var health  = 100
var reduce_health = 10
# 标记是否死亡
var is_died = false

func _ready() -> void:
	coins_total.text = "Score:"+ str(score)
	if health>0:
		health_label.text = "Health:"+str(health)
	var used_rect = tile_map_layer.get_used_rect().grow(-1)
	if used_rect.size == Vector2i.ZERO:
		#无图块时跳过
		return 
	var tile_size = tile_map_layer.tile_set.tile_size
	#限制摄像机移动边界
	camera_2d.limit_top = used_rect.position.y * tile_size.y
	camera_2d.limit_left = used_rect.position.x * tile_size.x
	camera_2d.limit_bottom = used_rect.end.y * tile_size.y
	#camera_2d.limit_right = used_rect.end.x * tile_size.x
	#处理加载瞬间会显示地图出地图外元素的问题
	camera_2d.reset_smoothing()
	
func add_score() :
	score += 1
	coins_total.text = "Score:"+ str(score)

#玩家生命值判定
func edit_health()->bool:
	if health > reduce_health and not is_died:
		health -= reduce_health
		health_label.text = "Health:"+str(health)
	else:
		health = 0
		health_label.text = "Health:"+str(health)
		is_died=true
	return is_died
		

func died():
	health = 0
	health_label.text = "Health:"+str(health)
	is_died=true
