class_name MainMenu
extends Node2D

signal start_button_pressed

@onready var canvas: CanvasLayer = $CanvasLayer

func disable() -> void:
	hide()
	canvas.hide()
	
	process_mode = Node.PROCESS_MODE_DISABLED

func _on_main_menu_ui_start_pressed() -> void:
	start_button_pressed.emit()
