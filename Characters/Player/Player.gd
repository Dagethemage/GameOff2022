extends KinematicBody2D
class_name Player

export var ACCELERATION = 500
export var MAX_SPEED = 100
export var ROLL_SPEED = 125
export var FRICTION = 500

onready var animPlayer = $AnimationPlayer
onready var animTree = $AnimationTree
onready var animState = animTree.get("parameters/playback")

var velocity: Vector2 = Vector2.ZERO

enum{
	MOVE,
	ATTACK
}

var state = MOVE

func _physics_process(_delta): #use the physics_process for getting players position
	match state:
		MOVE:
			move_state(_delta)
		ATTACK:
			attack_state(_delta)

func move_state(_delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
#		animTree.set("parameters/Idle/blend_position", input_vector)
#		animTree.set("parameters/Run/blend_position", input_vector)
#		animTree.set("parameters/Attack/blend_position", input_vector)
#		animTree.set("parameters/Roll/blend_position", input_vector)
#		animState.travel("Run")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * _delta)
	else:
#		animState.travel("Idle")
		velocity = Vector2.ZERO.move_toward(Vector2.ZERO, FRICTION * _delta)
	
	move()
	
#	if Input.is_action_just_pressed("attack"):
#		state = ATTACK


func attack_state(_delta):
	velocity = Vector2.ZERO
#	animState.travel("Attack")

func move():
	velocity = move_and_slide(velocity)

#func roll_anim_finished():
#	velocity = Vector2.ZERO
#	state = MOVE
#
#func attack_anim_finished():
#	state = MOVE
