@tool
extends VBoxContainer

@onready var pb_node = $ProgressBar
@onready var label_node = $Label

@export_range(0, 100, 1) var value := 75:
    set(new_value):
        value = new_value
        pb_node.value = new_value
    get:
        return value

@export var day := '一':
    set(value):
        day = value
        label_node.text = value
    get:
        return day


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass
