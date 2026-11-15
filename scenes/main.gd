extends Node2D

# mmmmmm yes very basic

@onready var main_menu = $CanvasLayer/MainMenu

func _on_main_menu_start_pressed() -> void:
	main_menu.hide()
