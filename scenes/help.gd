extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var vec = get_viewport().get_mouse_position()
	$PointLight2D.position = vec # move by that vector
	
	var mouse_x = vec.x
	var mouse_y = vec.y
	var relative_x = (mouse_x - (get_viewport_transform().x.x/2)) / (get_viewport_transform().x.x/2)
	var relative_y = (mouse_y - (get_viewport_transform().y.y/2)) / (get_viewport_transform().y.y/2)
