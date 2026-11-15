extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var is_boosting: bool = false # used for animation
var rotational_acceleration: float = 100
var acceleration: float = 100

func _physics_process(delta: float) -> void:
	var rotation_direction := Input.get_axis("rocket left", "rocket right")
	rotation += rotation_direction * rotational_acceleration * delta
	
	var thrust_input := Input.get_axis("rocket down", "rocket up")
	if thrust_input != 0.0:
		velocity += transform.x * thrust_input * acceleration * delta
	
	move_and_slide()	

func _process(delta: float) -> void:
	if Input.is_action_pressed("rocket boost"):
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
