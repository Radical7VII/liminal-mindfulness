extends Control


@onready var anim_node = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
    var scene_name = get_parent().get_parent().get_parent().get_name()
    
    print('该父级名字为：%s' % scene_name)
    if scene_name == 'MainScene':
        anim_node.play('welcome')
    elif scene_name == 'SpaceScene':
        anim_node.play('space')
    elif scene_name == 'GalleryScene':
        anim_node.play('gallery')
    elif scene_name == 'GardenScene':
        anim_node.play('garden')
    elif scene_name == 'MindScene':
        anim_node.play('mind')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
    pass


func _on_animation_player_animation_finished(_anim_name:StringName):
    pass # Replace with function body.
