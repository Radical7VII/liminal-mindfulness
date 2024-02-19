@tool
class_name MainScene
extends DemoSceneBase


func _ready():
    super()


# func _on_select_gender_player_gender(gender:Variant):
#     # 选择性别
#     print('玩家选择性别' + gender)
#     gender_selector_visible()


# func gender_selector_visible() -> bool:
#     # 这里应该选择删除，而不是隐藏可见
#     $SelectGender.queue_free()
#     return true


func _on_teleport_area_body_entered(body:Node3D):
    get_tree().change_scene_to_file("res://new_scenes/city_indoor_scene/city_indoor_scene.tscn")
