extends CharacterBody2D
@onready var player: CharacterBody2D = $"../Proto_Player"
@export var speed = 30

var health := 50:
	set(value):
		health = clamp (value, 0, 100)
func _physics_process(delta: float) -> void:
	var direction = (player.position-position).normalized()
	velocity=direction*speed
	look_at(player.position)
	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Bullet"):
		health -= Global.protogun_DMG
		print(health)
func die():
	queue_free()
func _process(delta: float) -> void:
	if health == 0:
		die()
	 
