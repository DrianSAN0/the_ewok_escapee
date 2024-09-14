extends CharacterBody2D

@export var speed = 50.0
const JUMP_VELOCITY = -400.0
var anim_tree : AnimationNodeStateMachinePlayback
var lifePoints = 5
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var direction = 0
@export var flip : bool

func _ready():
	$Sprite2D.flip_h = flip
	anim_tree = $AnimationTree.get("parameters/playback")

func _physics_process(delta):
	velocity.y += gravity * delta
	if not is_on_floor():
		anim_tree.travel("fall")
	else:
		anim_tree.travel("walk") 
		velocity.x = direction * speed
	move_and_slide()

