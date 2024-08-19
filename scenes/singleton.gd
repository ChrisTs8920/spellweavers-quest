extends Node

var power_up_1 = false
var power_up_2 = false

var timer1 = Timer.new()
var timer2 = Timer.new()

func set_power_up_1(bool):
	power_up_1 = bool

func set_power_up_2(bool):
	power_up_2 = bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer1.autostart = false
	timer2.autostart = false
	
	timer1.one_shot = true
	timer2.one_shot = true
	
	timer1.paused = false
	timer2.paused = false
	
	add_child(timer1)
	add_child(timer2)
	
	# timer1.connect("timeout", on_timer1_timeout)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
