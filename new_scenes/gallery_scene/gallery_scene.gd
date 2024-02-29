@tool
class_name GalleryScene
extends XRToolsSceneBase


# types of paints
enum ArtType {
    # 抽象主义
    ABSTRACTIONISM,
    # 写实主义
    REALISM,
    # 印象主义
    IMPRESSIONISM,
}

@export_group("Teleport")

@export_file('*.tscn') var scene : String

# Called when the node enters the scene tree for the first time.
func _ready():
    pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
    pass


func _on_paint_1_pointer_event(event:Variant):
    if event.event_type != XRToolsPointerEvent.Type.PRESSED:
        return
    selected_paint(ArtType.ABSTRACTIONISM)


func _on_paint_2_pointer_event(event:Variant):
    if event.event_type != XRToolsPointerEvent.Type.PRESSED:
        return
    selected_paint(ArtType.REALISM)


func _on_paint_3_pointer_event(event:Variant):
    if event.event_type != XRToolsPointerEvent.Type.PRESSED:
        return
    selected_paint(ArtType.IMPRESSIONISM)


func selected_paint(paint_name:ArtType):
    # 当玩家选择了画后
    print('选择了：%s 画派' % paint_name)
    match paint_name:
        ArtType.ABSTRACTIONISM:
            print('你选择了抽象派。这代表你可能寻求自由和想象，具有开放、富有创造力的性格')
        ArtType.REALISM:
            print('你选择了写实主义。这代表你可能更注重实际和细节的性格')
        ArtType.IMPRESSIONISM:
            print('你选择了印象派。这代表你可能在心理上追求柔和情感，具有细腻、感性的性格。')
    # 计时开始，准备传送
    $Timer.start()
	

func _on_timer_timeout():
    # 倒计时结束
    teleport()


func teleport():
    # 传送用的
    var _scene_base : XRToolsSceneBase
    _scene_base = XRTools.find_xr_ancestor(self, "*", "XRToolsSceneBase")
    _scene_base.load_scene(scene, '')
