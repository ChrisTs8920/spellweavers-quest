extends Control

func pause():
	$Camera2D.make_current()
	show()
	get_tree().paused = true

func resume():
	get_tree().paused = false
	hide()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		if !get_tree().paused:
			pause()
		else:
			resume()
		
