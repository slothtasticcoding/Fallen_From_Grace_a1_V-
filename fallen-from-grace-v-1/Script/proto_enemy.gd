extends CharacterBody2D
@onready var player: CharacterBody2D = $"../Proto_Player"
@export var speed = 80
func _physics_process(delta: float) -> void:
	var direction = (player.position-position).normalized()
	velocity=direction*speed
	look_at(player.position)
	move_and_slide()
