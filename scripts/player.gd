extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var is_boosting: bool = false # used for animation
var angular_acceleration: float = 0.3 
var angular_friction: float = 0.01 # speed change when not accelerating
var acceleration: float = 100
var friction: float = 1 # speed change when not accelerating

var angular_velocity: float = 0

func _physics_process(delta: float) -> void:
	var rotation_direction := Input.get_axis("rocket left", "rocket right")
	if rotation_direction != 0:
		angular_velocity += rotation_direction * angular_acceleration * delta 
	else:
		angular_velocity = move_toward(angular_velocity, 0, angular_friction)
	rotation += angular_velocity
	
	var thrust_input := Input.get_axis("rocket down", "rocket up")
	if thrust_input != 0:
		velocity += -transform.y * thrust_input * acceleration
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction)
	
	move_and_slide()

func _process(delta: float) -> void:
	if Input.is_action_pressed("rocket up"):
		is_boosting = true
	else:
		is_boosting = false
			
	animate_boost()

func _on_animated_sprite_2d_animation_finished() -> void:
	if sprite.animation == "transition":
		if is_boosting:
			sprite.play("on")
		else:
			sprite.play("off")
			
# value is either on or off
# handles animation between the states
func animate_boost() -> void:
	if sprite.animation == "off" and is_boosting:
		sprite.speed_scale = 1.0
		sprite.play("transition")
	
	elif sprite.animation == "on" and not is_boosting:
		sprite.speed_scale = -1.0
		sprite.play("transition", 1.0, true)
		
	if sprite.animation == "transition":
		sprite.speed_scale = 1.0 if is_boosting else -1.0
