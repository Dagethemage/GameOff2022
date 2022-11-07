extends Area2D

export(Array, PackedScene) var room = []

func _ready() -> void:
	pass

func _on_Door_body_entered(body: Node) -> void:
	if "Player" in body.name:
		get_tree().reload_current_scene()
