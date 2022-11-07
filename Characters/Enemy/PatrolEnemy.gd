extends Path2D

enum ANIM_TYPE{
	LOOP,
	BOUNCE
}

onready var animation_player: AnimationPlayer = $AnimationPlayer


export(ANIM_TYPE) var anim_type
export(float) var speed = 1 setget set_speed

func _ready() -> void:
	match anim_type:
		ANIM_TYPE.LOOP: animation_player.play("MoveAlongPathLoop")
		ANIM_TYPE.BOUNCE: animation_player.play("MoveAlongPathBounce")

func set_speed(value):
	speed = value
	var ap = find_node("AnimationPlayer")
	if ap: ap.playback_speed = speed
