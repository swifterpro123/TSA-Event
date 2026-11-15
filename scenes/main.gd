extends Node2D

# mmmmmm yes very basic

# the game (lol) and sub games should all be in their own little scenes
# main node should simply manage all of them
# so please change everything here eventually, this is just placeholder stuff

@onready var main_menu = $CanvasLayer/MainMenu

func _on_main_menu_start_pressed() -> void:
	main_menu.hide()
