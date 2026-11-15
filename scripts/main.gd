extends Node2D

# mmmmmm yes very basic

# the game (lol) and sub games should all be in their own little scenes
# main node should simply manage all of them
# so please change everything here eventually, this is just placeholder stuff

const MAIN_MENU_SCENE: PackedScene = preload("res://scenes/main_menu.tscn")
const SPACE_SCENE: PackedScene = preload("res://scenes/space.tscn")

@onready var main_menu: MainMenu = MAIN_MENU_SCENE.instantiate()
@onready var space: Node2D = SPACE_SCENE.instantiate()

var current_scene = null:
	set(new_value):
		if is_instance_valid(current_scene):
			remove_child(current_scene)
		add_child(new_value)
		current_scene = new_value
	get:
		return current_scene

func _ready() -> void:
	current_scene = main_menu
	
	main_menu.start_button_pressed.connect(change_scene.bind(space))

func change_scene(new_scene) -> void:
	current_scene = new_scene
	
