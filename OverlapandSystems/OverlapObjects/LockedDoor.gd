extends StaticBody2D

func _ready():
	if self.name in Global.door_opened:
		queue_free()

func _on_Area2D_body_entered(body: Node) -> void:
	if self.name in Global.key_found and "Player" in body.name:
		Global.door_opened.append(self.name)
		queue_free()
	
	if not self.name in Global.key_found and "Player" in body.name:
		$Label.show()


func _on_Area2D_body_exited(body: Node) -> void:
	$Label.hide()
