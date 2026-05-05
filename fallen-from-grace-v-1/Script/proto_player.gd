extends CharacterBody2D

var speed = 400  # speed in pixels/sec

func _physics_process(delta):
	var direction = Input.get_vector("LEFT","RIGHT","UP","DOWN")
	velocity = direction * speed

	move_and_slide()
