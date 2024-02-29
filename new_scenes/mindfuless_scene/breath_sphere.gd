extends Node3D


@onready var anim_node = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
    play_once()


func _on_animation_player_animation_finished(anim_name):
    # print('播放结束，开始下一次循环')
    play_once()


func play_once():
    anim_node.play('SphereAction')
    # print('开始播放')
