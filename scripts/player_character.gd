extends CharacterBody2D

const ACCELERATION: float = 450
const FRICTION: float = 100

func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("character left", "character right", "character up", "character down")
	
	if not direction.is_zero_approx():
		velocity += direction * ACCELERATION * delta
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	move_and_slide()
