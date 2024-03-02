@tool
extends XRToolsSceneBase

enum Flower {
    DAISY,
    SUNFLOWER,
    VIOLET
}

@export_group("Teleport")

@export_file('*.tscn') var scene : String


@onready var subtitle_anim_player = $Subtitle/Viewport/Subtitle/AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
    if !Engine.is_editor_hint():
        subtitle_anim_player.play('garden_start')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
    pass


func selected_flower(flower_name:int):
    # 当玩家选择了画后
    print('选择了：%s 画派' % flower_name)
    match flower_name:
        Flower.DAISY:
            subtitle_anim_player.play('garden_daisy')
        Flower.SUNFLOWER:
            subtitle_anim_player.play('garden_sunflower')
        Flower.VIOLET:
            subtitle_anim_player.play('garden_violet')
    # 计时开始，准备传送
    $Timer.start()


func _on_timer_timeout():
    teleport()


func teleport():
    # 传送用的
    var _scene_base : XRToolsSceneBase
    _scene_base = XRTools.find_xr_ancestor(self, "*", "XRToolsSceneBase")
    _scene_base.load_scene(scene, '')


func _on_daisy_select_flower(flower_name:Variant):
    selected_flower(Flower.DAISY)


func _on_sunflower_select_flower(flower_name:Variant):
    selected_flower(Flower.SUNFLOWER)


func _on_violet_select_flower(flower_name:Variant):
    selected_flower(Flower.VIOLET)
