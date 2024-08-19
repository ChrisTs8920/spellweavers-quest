extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("default")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	Hud.powerup_count += 1
	$pickup.play()
	$AnimatedSprite2D.hide()
	$CollisionShape2D.set_deferred("disabled", true)
	if (Hud.powerup_count == 1):
		Singleton.set_power_up_1(true)
		Singleton.timer1.start(5)
	if (Hud.powerup_count == 2):
		Singleton.set_power_up_2(true)
		Singleton.timer2.start(5)
	#queue_free()
