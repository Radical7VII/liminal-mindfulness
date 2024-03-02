@tool
class_name MainScene
extends DemoSceneBase


@onready var subtitle_anim_player = $Subtitle/Viewport/Subtitle/AnimationPlayer


func _ready():
    super()

    if !Engine.is_editor_hint():
        subtitle_anim_player.play('lobby_start')
