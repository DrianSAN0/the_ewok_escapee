extends Control



signal sendMenu
signal sendEnd
# Called when the node enters the scene tree for the first time


func _on_top_ui_pause():
	print("uwu")
	get_tree().change_scene_to_file("res://scenes/pause_menu.tscn")
	emit_signal("sendMenu")


func _on_top_ui_game_over(time):
	get_tree().change_scene_to_file("res://scenes/last_scene.tscn")
	emit_signal("sendEnd", time)
