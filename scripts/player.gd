extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
var is_igniting: bool = false

func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_select"):
		if sprite.animation == "off":
			sprite.play("starting")
			is_igniting = true
	else:
		if sprite.animation == "on":
			sprite.play_backwards("starting")
			is_igniting = false

func _on_animated_sprite_2d_animation_finished() -> void:
	if sprite.animation == "starting":
		if is_igniting:
			print("on")
			sprite.play("on")
		else:
			print("off")
			sprite.play("off")
