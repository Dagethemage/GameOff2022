extends Node2D

enum CAM_LOCATION{
	LEFT_WALL,
	RIGHT_WALL,
	BOTTOM_WALL,
	TOP_WALL
}

export(CAM_LOCATION) var cam_location
onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	match cam_location:
		CAM_LOCATION.LEFT_WALL: animation_player.play("left_wall")
		CAM_LOCATION.RIGHT_WALL: animation_player.play("right_wall")
		CAM_LOCATION.BOTTOM_WALL: animation_player.play("bottom_wall")
		CAM_LOCATION.TOP_WALL: animation_player.play("top_wall")


func _on_Area2D_body_entered(body: Node) -> void:
	if "Player" in body.name:
		get_tree().reload_current_scene()
