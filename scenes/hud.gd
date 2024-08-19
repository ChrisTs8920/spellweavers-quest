extends CanvasLayer

var coin_count = 0
var powerup_count = 0
var death_count = 0
var collected = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $coin_count != null:
		$coin_count.set_text(str(coin_count))
		
	if $powerup_count != null:
		$powerup_count.set_text(str(powerup_count))
		
	if $death_count != null:
		$death_count.set_text(str(death_count))
	
	if Singleton.power_up_1:
		if Singleton.timer1 != null and !Singleton.timer1.is_stopped():
			$powerup1_lbl.show()
		else:
			$powerup1_lbl.hide()
	if Singleton.power_up_2:
		if Singleton.timer2 != null and !Singleton.timer2.is_stopped():
			$powerup2_lbl.show()
		else:
			$powerup2_lbl.hide()
		
	# if coin_count == 13:
		# $coin_total.label_settings.font_color = Color(1, 1, 0, 1)
		# $coin_count.label_settings.font_color = Color(1, 1, 0, 1)
