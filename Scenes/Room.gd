extends Node2D

func _ready() -> void:
	EventBus.connect("battle_started", self, "_on_battle_started")
	EventBus.connect("battle_ended", self, "_on_battle_ended")

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		EventBus.emit_signal("battle_ended")

func _on_battle_started():
	$BattleUI.show()
	

func _on_battle_ended():
	$BattleUI.hide()
