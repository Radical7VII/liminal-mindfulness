extends Node3D
class_name SelectGender

signal player_gender(gender)


func _on_male_button_pressed(button:Variant):
    # 选择男生
    if not button:
        player_gender.emit('male')


func _on_female_button_pressed(button:Variant):
    # 选择女生
    if not button:
        player_gender.emit('female')
