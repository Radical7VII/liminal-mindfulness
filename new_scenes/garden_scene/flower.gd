@tool
class_name Flower
extends RigidBody3D


signal select_flower(flower_name)

@export var flower_name := '': set = set_flower_name


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
    pass


# Handle pointer events
func pointer_event(event : XRToolsPointerEvent) -> void:
    if event.event_type == XRToolsPointerEvent.Type.PRESSED:
        print('选择了花：%s' % flower_name)
        select_flower.emit(flower_name)


func set_flower_name(new_name: String):
    flower_name = new_name


