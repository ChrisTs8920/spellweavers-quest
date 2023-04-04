extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	var anima = (Anima.begin(self).then(Anima.Node($node).anima_animation("back_in_up", 1.0))).play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
