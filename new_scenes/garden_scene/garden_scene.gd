@tool
extends XRToolsSceneBase

enum Flower {
    FLOWER1,
    FLOWER2,
    FLOWER3
}

@export_group("Teleport")

@export_file('*.tscn') var scene : String


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
    pass


func _on_flower_select_flower(flower_name:Variant):
    selected_flower(Flower.FLOWER1)


func _on_flower2_select_flower(flower_name:Variant):
    selected_flower(Flower.FLOWER2)


func _on_flower3_select_flower(flower_name:Variant):
    selected_flower(Flower.FLOWER3)


func selected_flower(flower_name:int):
    # 当玩家选择了画后
    print('选择了：%s 画派' % flower_name)
    match flower_name:
        Flower.FLOWER1:
            pass
        Flower.FLOWER2:
            pass
        Flower.FLOWER3:
            pass
    # 计时开始，准备传送
    $Timer.start()


func _on_timer_timeout():
    teleport()


func teleport():
    # 传送用的
    var _scene_base : XRToolsSceneBase
    _scene_base = XRTools.find_xr_ancestor(self, "*", "XRToolsSceneBase")
    _scene_base.load_scene(scene, '')
