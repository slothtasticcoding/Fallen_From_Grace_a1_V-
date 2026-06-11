extends AnimatedSprite2D

@onready var reload: Timer = $Timer
@onready var marker_2d: Marker2D = $Marker2D
var bullet_shot = 1
const bullet = preload("res://Scenes/Proto_Handgun_Bullet.tscn")
var shot_time =0.7
var can_shoot = true



func _ready() -> void:
	reload.wait_time = shot_time

func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	if Global.BA == 0:
		can_shoot = false
	
func Proto_Handgun_shoot() -> void:
		if can_shoot == true:
			print("PEW")
			var new_bullet = bullet.instantiate()
			new_bullet.position = marker_2d.global_position
			new_bullet.target_position = (get_global_mouse_position() - marker_2d.global_position).normalized()
			Global.level.add_child(new_bullet)
			can_shoot = false 
			Global.BA -=1
			reload.start()


func _on_timer_timeout() -> void:
	can_shoot = true # Replace with function body.
