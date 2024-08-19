extends Node2D

signal start_game
signal about

const SPEED = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var vec = get_viewport().get_mouse_position()
	$PointLight2D.position = vec # move by that vector
	
	var mouse_x = vec.x
	var mouse_y = vec.y
	var relative_x = (mouse_x - (get_viewport_transform().x.x/2)) / (get_viewport_transform().x.x/2)
	var relative_y = (mouse_y - (get_viewport_transform().y.y/2)) / (get_viewport_transform().y.y/2)

func _on_exit_pressed():
	get_tree().quit()

func _on_start_pressed():
	start_game.emit()
	Ambient.play()
	WaterDrip.play()
	Hud.show()

func _on_help_pressed():
	about.emit()
