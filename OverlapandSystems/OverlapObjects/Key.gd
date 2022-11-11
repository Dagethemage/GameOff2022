extends Node2D

func _ready():
	if self.name in Global.key_found:
		queue_free()
	print(Global.key_found)

func _on_Area2D_body_entered(body: Node) -> void:
	if  "Player" in body.name:
		Global.key_found.append(self.name)
		queue_free()
