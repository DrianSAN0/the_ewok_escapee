extends Control

signal  Get_to_game
signal Close_window

func _on_start_button_down():
	get_tree().change_scene_to_file("res://scenes/control.tscn")


func _on_leave_button_down():
	get_tree().quit()
