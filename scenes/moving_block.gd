extends AnimatableBody2D

var left = true
var right = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta): # x = 288 - 928
	
	if left:
		position += constant_linear_velocity
		if position.x == 928:
			left = false
			right = true
	
	if right:
		position -= constant_linear_velocity
		if position.x == 288:
			left = true
			right = false
	
	
