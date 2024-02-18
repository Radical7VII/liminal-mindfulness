extends Node3D

signal button_pressed 


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.



func _on_interactable_area_button_button_pressed(button:Variant):
    pass
    button_pressed.emit('player_pressed', true)


func _on_interactable_area_button_button_released(button:Variant):
    button_pressed.emit('player_pressed', false)
