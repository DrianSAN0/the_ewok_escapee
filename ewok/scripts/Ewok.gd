extends CharacterBody2D

signal changeItems
signal lose_life
signal game_over
var speed = 150.0
var jump_speed = -650.0
var push_force = 80.0
var direction = 0
var gravity = 981
var anim_tree : AnimationNodeStateMachinePlayback
var items_list = [0,0,0]
var lifePoints = 5

func _ready():
	anim_tree = $AnimationTree.get("parameters/playback")

func _process(delta):


	if Input.is_action_just_pressed("Shoot I1"):
		if(items_list[0] > 0):
			items_list[0] -= 1
		print(items_list)
	if Input.is_action_just_pressed("Shoot I2"):
		if(items_list[1] > 0):
			items_list[1] -= 1
		print(items_list)
	if Input.is_action_just_pressed("Shoot I3"):
		if(items_list[2] > 0):
			items_list[2] -= 1
		print(items_list)

func _physics_process(delta):
	velocity.y += gravity * delta
	if is_on_floor():
		if velocity.x != 0:
			anim_tree.travel("walk")
		else:
			anim_tree.travel("idle")
		
	if velocity.y < 0:
		anim_tree.travel("jump")
	else:
		if not is_on_floor():
			anim_tree.travel("fall")
	
	if Input.is_action_pressed("left"):
		direction = -1
		$Sprite2D.flip_h = true
	elif Input.is_action_pressed("right"):
		direction = 1
		$Sprite2D.flip_h = false
	else:
		direction = 0
	velocity.x = direction * speed
	
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = jump_speed
	
	move_and_slide()
	
func _on_item_2_item_picked(number):
	items_list[number] += 1
	emit_signal("changeItems", items_list)
	
func _on_hurt_box_area_entered(area):
	lifePoints -= 1
	emit_signal("lose_life", lifePoints)
	if(lifePoints <= 0):
		emit_signal("game_over")
	print(lifePoints)

	
