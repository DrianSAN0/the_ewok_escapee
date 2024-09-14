extends CharacterBody2D

var timer : Timer
var number : int
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var rSprite = $Area2D/Sprite2D

signal restart


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var picked = false
@export var waiting = false
var waitingLife = RandomNumberGenerator.new().randi_range(3, 5)
var randomN = RandomNumberGenerator.new().randi_range(0, 2)

func _ready():
	timer = $Timer


func _physics_process(delta):
	# Add the gravity.
	if not picked:
		if not is_on_floor():
			velocity.y += gravity * delta
		else:
			if(!waiting):
				waiting = true
				timer.start()
			if(waitingLife == 0):
				die()
	move_and_slide()

signal item_picked

func sum_to_ewok_items():
	emit_signal("item_picked", randomN)

func die():
	var tween = create_tween()
	timer.stop()
	tween.tween_property(self, "modulate:a", 0.0, 0.3)
	tween.tween_callback(self.queue_free)
	emit_signal("restart", number)


func _on_area_2d_body_entered(body):

	var tween = create_tween()
	picked = true
	timer.stop()
	tween.tween_property(self, "position", position + Vector2(0,-30), 0.3)
	tween.tween_property(self, "modulate:a", 0.0, 0.3)
	tween.tween_callback(self.sum_to_ewok_items)
	tween.tween_callback(self.queue_free)
	emit_signal("restart", number)


func _on_timer_timeout():
	waitingLife -= 1


func _on_background_start_items():
	gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
	picked = false
	waitingLife = RandomNumberGenerator.new().randi_range(3, 5)
	randomN = RandomNumberGenerator.new().randi_range(0, 2)

	if randomN == 2:
		rSprite.texture = preload("res://assets/weapons/rama.png")
	elif randomN == 1:
		rSprite.texture = preload("res://assets/weapons/piedra.png")
	else:
		rSprite.texture = preload("res://assets/weapons/lanza.png")
	timer = $Timer

