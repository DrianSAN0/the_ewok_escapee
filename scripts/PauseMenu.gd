extends Control
 
signal Get_to_game
signal Close_window

func _on_continue_button_down():
	get_tree().change_scene_to_file("res://scenes/control.tscn")


func _on_close_button_down():
	get_tree().quit()
