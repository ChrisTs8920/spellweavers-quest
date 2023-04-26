extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	Hud.collected = true
	Hud.coin_count += 1
	$pickup.play()
	$AnimatedSprite2D.hide()
	$CollisionShape2D.set_deferred("disabled", true)
