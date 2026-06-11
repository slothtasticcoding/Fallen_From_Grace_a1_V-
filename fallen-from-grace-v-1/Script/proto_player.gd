extends CharacterBody2D
@onready var gun: AnimatedSprite2D = $Proto_Handgun
var bullets_per_shot = 3
var health = Global.player_max_health
var getting_hit = false
var speed = 600  # speed in pixels/sec

func _physics_process(delta):
	var direction = Input.get_vector("LEFT","RIGHT","UP","DOWN")
	velocity = direction * speed

	move_and_slide()
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		print("SIGNAL")
		gun.Proto_Handgun_shoot()
		

func _process(delta: float) -> void:
	if health <= 0:
		print("daeth")
		die()
func _on_hit_box_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemy"):
		health -= 10
		getting_hit = true
		print("Getting hit")
func die():
	get_tree().reload_current_scene() # Replace level code


func _on_hit_box_area_exited(area: Area2D) -> void:
	if area.is_in_group("Enemy"):
		getting_hit = false 
		print("PHEW")# Replace with function body.


func _on_timer_timeout() -> void:
	if getting_hit == true:
		health -= 10
		print(health) 
