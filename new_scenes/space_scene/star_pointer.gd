@tool
extends RigidBody3D

signal select_star(star_name)

@export var star_name = 'mars': set = set_star_name

var is_ready : bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
    is_ready = true


# Handle pointer events
func pointer_event(event : XRToolsPointerEvent) -> void:
    if event.event_type == XRToolsPointerEvent.Type.PRESSED:
        # print('选择了星星：%s' % star_name)
        select_star.emit(star_name)

func set_star_name(new_name: String):
    star_name = new_name
