extends CharacterBody2D


const SPEED = 350.0
const JUMP_VELOCITY = -400.0
var fps
var power_up_1 = false
var power_up_2 = false

func set_power_up_1(bool):
	power_up_1 = bool

func set_power_up_2(bool):
	power_up_2 = bool

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _process(delta):
	if get_tree().paused == false:
		$Camera2D.make_current() #recenter camera after pause
	$GPUParticles2D.emitting = false
	$GPUParticles2D.explosiveness = 0
	$AnimatedSprite2D.play("default")
	if velocity.x > 0 and is_on_floor():
		$GPUParticles2D.emitting = true
		$AnimatedSprite2D.play("move")
		$AnimatedSprite2D.flip_h = false
	elif velocity.x < 0 and is_on_floor():
		$GPUParticles2D.emitting = true
		$AnimatedSprite2D.play("move")
		$AnimatedSprite2D.flip_h = true
	
	var i = get_tree().get_current_scene().get_name().substr(5, 7) #current lvl
	if int(i) > 6:
		set_power_up_1(true)
	if int(i) > 11:
		set_power_up_2(true)
	
	#fix jittery movement
	Engine.max_fps = DisplayServer.screen_get_refresh_rate() #max fps = monitor refresh rate
	fps = Engine.get_frames_per_second()
	Engine.physics_ticks_per_second = fps #fps = tps
	
	

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$Jump.play()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	#Power up 1: Wall climb
	if power_up_1:
		if is_on_wall() and Input.is_action_just_pressed("ui_accept"):
			velocity.y = JUMP_VELOCITY
	
	#Power up 2: Change size
	$RayUp.target_position = Vector2.UP * 100 #raycasts prevents player from glitching inside wall
	$RayLeft.target_position = Vector2.RIGHT * 100
	$RayRight.target_position = Vector2.LEFT * 100
	
	if power_up_2: #scaling between 0.1 and 1.0
		if Input.is_action_just_pressed("scale_down"):
			if (scale.x >= 0.2 and scale.y >= 0.2):
				scale.x -= 0.1
				scale.y -= 0.1
		if (Input.is_action_just_pressed("scale_up") and !$RayUp.is_colliding() and
		!$RayLeft.is_colliding() and !$RayRight.is_colliding()):
			if (scale.x <= 1 and scale.y <= 1):
				scale.x += 0.1
				scale.y += 0.1
	
	move_and_slide()

func _on_spikes_body_entered(body):
	if body is CharacterBody2D:
		$hit.play()
		var name = get_tree().get_current_scene().get_name()
		await $hit.finished
		get_tree().change_scene_to_file("res://scenes/" + name + ".tscn")
