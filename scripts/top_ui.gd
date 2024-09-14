extends Control

signal game_over
signal pause

@onready var nramas = $Armas/MarginContainer/HBoxContainer/Rama/Nro
@onready var nlanzas = $Armas/MarginContainer/HBoxContainer/Lanza/Nro
@onready var npiedras = $Armas/MarginContainer/HBoxContainer/Piedra/Nro


@onready var nwhite = $Stormtroopers/MarginContainer/HBoxContainer/StormWhite/Nro
@onready var ngray = $Stormtroopers/MarginContainer/HBoxContainer/StormGray/Nro
@onready var nbrown = $Stormtroopers/MarginContainer/HBoxContainer/StromBrown/Nro

@onready var labelT = $Stormtroopers/Label

@onready var nlife = $Life/Nro
@onready var menu = $Menu
var time = 0
var timer : Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	timer = $Timer
	nramas.text = str(0)
	nlanzas.text = str(0)
	npiedras.text = str(0)
	nwhite.text = str(0)
	ngray.text = str(0)
	nbrown.text = str(0)
	nlife.text = "X 5"
	labelT.text = str(time)
	timer.start()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_background_show_items_in_ui(list_items):
	nramas.text = str(list_items[2])
	nlanzas.text = str(list_items[0])
	npiedras.text = str(list_items[1])


func _on_background_change_life(life):
	var a = "X " + str(life)
	if life >= 0:
		nlife.text = a
	else:
		_on_background_game_over()


func _on_timer_timeout():
	time += 1
	labelT.text = str(time)



func _on_menu_button_down():
	emit_signal("pause")


func _on_background_game_over():
	print("señal", time)
	emit_signal("game_over", time)
