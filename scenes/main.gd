extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Help.visible:
		if Input.is_action_pressed("pause"):
			$MainMenu.show()
			$Help.hide()

func new_game():
	get_tree().change_scene_to_file("res://scenes/level1.tscn")

func help():
	$MainMenu.hide()
	$Help.show()
	
