extends Control

@onready var score = $BoxContainer/TextureRect/TextureRect/Score
func _ready():
	score.text = str(0)


func _on_leave_button_down():
	get_tree().quit();


#func _on_control_send_end():
#	get_tree().change_scene_to_file("res://scenes/last_scene.tscn")


func _on_control_send_end(time):
	score.text = str(time)


func _on_retry_button_down():
	get_tree().change_scene_to_file("res://scenes/control.tscn")
