@tool
extends XRToolsSceneBase


@onready var subtitle_anim_player = $Subtitle/Viewport/Subtitle/AnimationPlayer  # 字幕
@onready var breath_sphere = $breath_sphere 
@onready var core = $core
@onready var result_ui = $result/Viewport/Result/AnimationPlayer


enum State {
    # 开局
    START,
    # 进入练习
    PRACTICE,
    # 结算画面
    RESULT_DIALOG,
    RESULT
}


# Called when the node enters the scene tree for the first time.
func _ready():
    # 如果当前是编辑器下
    if Engine.is_editor_hint():
        return
    change_state(State.START)
    await get_tree().create_timer(12).timeout

    change_state(State.PRACTICE)
    await get_tree().create_timer(20).timeout
    
    change_state(State.RESULT_DIALOG)
    await get_tree().create_timer(6).timeout

    change_state(State.RESULT)


func change_state(state: State):
    # 改变当前状态
    match state:
        State.START:
            print('start')
            subtitle_anim_player.play('mind_start')
        State.PRACTICE:
            print('practice')
            $Subtitle.visible = false
            breath_sphere.visible = true
        State.RESULT_DIALOG:
            print('result dialog')
            breath_sphere.visible = false
            $Subtitle.visible = true
            subtitle_anim_player.play('mind_result')
        State.RESULT:
            print('result')
            $Subtitle.visible = false
            $result.visible = true
            result_ui.play('show_up')
