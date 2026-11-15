extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var is_boosting: bool = false



func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_accept"):
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
