extends CharacterBody2D

const SPEED = 75
var dir_val = [-1, 1]
var direction = dir_val.pick_random()
var prev_dir = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$GPUParticles2D.emitting = false
	$AnimatedSprite2D.play("default")
	if velocity.x > 0 and is_on_floor():
		$GPUParticles2D.emitting = true
		$AnimatedSprite2D.play("move")
		$AnimatedSprite2D.flip_h = false
	elif velocity.x < 0 and is_on_floor():
		$GPUParticles2D.emitting = true
		$AnimatedSprite2D.play("move")
		$AnimatedSprite2D.flip_h = true
	
	
	move_and_slide()

func _physics_process(delta):
	if is_on_wall():
		direction = -direction
	velocity.x = SPEED * direction
	
	if direction == 0:
		await get_tree().create_timer(2).timeout #stay still for 2 sec
		$Timer.start()
		direction = prev_dir
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta


func _on_timer_timeout():
	prev_dir = direction
	direction = 0
