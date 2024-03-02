@tool
extends XRToolsSceneBase


@export_group("Teleport")

@export_file('*.tscn') var scene : String


enum Stars {
    MARS,
    SATURN,
    PLUTO
}

@onready var subtitle_anim_player = $Subtitle/Viewport/Subtitle/AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
    if Engine.is_editor_hint():
        return
    subtitle_anim_player.play('space_start')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
    pass


# 选择星星
func _on_pluto_select_star(_star_name:Variant):
    # 冥王星
    _on_selected(Stars.PLUTO)


func _on_saturn_select_star(_star_name:Variant):
    # 土星
    _on_selected(Stars.SATURN)


func _on_mars_select_star(_star_name:Variant):
    # 火星
    _on_selected(Stars.MARS)


func _on_selected(star_name:Stars):
    print('选择了星星：%s' % star_name)
    match star_name:
        Stars.MARS:
            subtitle_anim_player.play('space_mars')
        Stars.SATURN:
            subtitle_anim_player.play('space_saturn')
        Stars.PLUTO:
            subtitle_anim_player.play('space_pluto')
    $Timer.start()


func _on_timer_timeout():
    # 倒计时结束
    print('倒计时结束')
    teleport()


func teleport():
    # 传送用的
    var _scene_base : XRToolsSceneBase
    _scene_base = XRTools.find_xr_ancestor(self, "*", "XRToolsSceneBase")
    _scene_base.load_scene(scene, '')
