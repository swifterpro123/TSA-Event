extends Control

signal start_pressed

func _on_start_pressed() -> void:
	start_pressed.emit()
