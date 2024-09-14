extends Control


@onready var score = $LastScene/BoxContainer/TextureRect/TextureRect/Score
# Called when the node enters the scene tree for the first time.

func _on_menu_get_to_game():
	get_tree().change_scene_to_file("res://scenes/control.tscn")


func _on_menu_close_window():
	get_tree().quit()


func _on_pause_menu_close_window():
	_on_menu_close_window()


func _on_pause_menu_get_to_game():
	_on_menu_get_to_game()
