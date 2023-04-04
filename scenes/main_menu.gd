extends Node2D

signal start_game

const SPEED = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var vec = get_viewport().get_mouse_position()
	$PointLight2D.position = vec # move by that vector



func _on_exit_pressed():
	get_tree().quit()


func _on_start_pressed():
	Ambient.play()
	WaterDrip.play()
	start_game.emit()
