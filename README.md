
# GodotDemo2 横版平台游戏DEMO2

## 项目概述
基于 Godot 4.4.1 引擎开发的2D横版平台跳跃游戏，包含完整角色控制、敌人AI和关卡系统

## 核心功能
### 玩家系统
- 二段跳跃机制 `(player.gd)`
- 踩踏击杀敌人
- 玩家生命周期动画管理

### 敌人系统
- 史莱姆自动巡逻 `(slime.gd)`


### 全局管理
- 状态跟踪 `(game_manager.gd)`
```gdscript
var score :int = 0        # 金币分数
var health = 100          # 生命值 
var kill_enemy = 0        # 击杀计数
```

### 项目结构
GodotDemo2/
├── Scenes/               # 游戏场景
│   ├── Level1.tscn       # 第一关卡
│   ├── main_menu.tscn    # 主菜单
│   └── player.tscn       # 玩家角色
├── Scripts/              # 游戏逻辑
│   ├── player.gd         # 玩家控制
│   ├── slime.gd          # 敌人AI
│   └── game_manager.gd   # 全局状态
├── assets/               # 游戏资源
│   ├── sounds/           # 音效文件
│   ├── fonts/            # 像素字体
│   └── sprites/          # 角色素材
└── project.godot         # 引擎配置


### 物理层配置
```gdscript
2d_physics/layer_1="wall"          # 墙体碰撞
2d_physics/layer_2="player"        # 玩家角色
2d_physics/layer_3="enemy"         # 敌人单位
2d_physics/layer_4="coin"          # 可收集道具
```

## 运行指南
1. 安装 [Godot 4.4.1](https://godotengine.org/)
2. 克隆仓库：
```bash
git clone https://github.com/your-repo/GodotDemo2.git
```
3. 用Godot打开项目目录
4. 按F5运行主场景

## 操作说明
| 按键       | 功能         |
|------------|--------------|
| A/D，左箭头/右箭头        | 左右移动     |
| 空格键     | 跳跃        |
| ESC        | 返回主菜单  |

## 开发依赖
- Godot 4.4.1
- 像素字体：PixelOperator
- 音效资源：8-bit SFX Pack
```

该文档已根据实际项目结构编写，包含所有核心功能模块和配置说明，可直接保存使用。

        