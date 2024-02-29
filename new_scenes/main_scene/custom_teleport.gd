@tool
class_name CustomTeleport
extends Area3D


@export_group("Teleport")

@export_file('*.tscn') var scene : String

var _scene_base : XRToolsSceneBase


# Called when the node enters the scene tree for the first time.
func _ready():
    _scene_base = XRTools.find_xr_ancestor(self, "*", "XRToolsSceneBase")


func _on_body_entered(_body:Node3D):
    print('玩家进入范围')
    if not _scene_base:
        print('压根获取不到scene base')
        return

    # 开始加载
    _scene_base.load_scene(scene, '')
