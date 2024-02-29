extends CharacterBody3D

@onready var anim_player = $AnimationPlayer
@onready var anim_tree = $AnimationTree
@onready var anim_state = $AnimationTree.get('parameters/playback')


# Called when the node enters the scene tree for the first time.
func _ready():
    pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
    pass


func play_anim(anim_name:String):
    anim_state.travel(anim_name)
