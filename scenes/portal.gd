extends Area2D

var i: String
var j: String

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play()
	i = get_tree().get_current_scene().get_name().substr(5, 7) #current lvl
	print("Current level: ", i)
	
	if (int(i) >= 6 and int(i) < 11):
		$AnimatedSprite2D.animation = "portal02"
		$GPUParticles2D.get_process_material().color = Color(0.9, 0.9, 0, 1)
		#$PointLight2D.color = Color(0.4, 0.4, 0, 1)
	if int(i) >= 11:
		$AnimatedSprite2D.animation = "portal03"
		$GPUParticles2D.get_process_material().color = Color(0.9, 0, 0, 1)
		$PointLight2D.color = Color(0.4, 0, 0, 1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	$sound.play()
	await $sound.finished
	get_tree().change_scene_to_file("res://scenes/level" + str(int(i) + 1) + ".tscn")
