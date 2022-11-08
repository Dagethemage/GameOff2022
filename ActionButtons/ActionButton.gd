extends Button

const BU = preload("res://OverlapandSystems/BattleUnits.tres")

func _ready() -> void:
	EventBus.connect("turn_ended", self, "_on_turn_ended")

func _on_turn_ended():
	EventBus.emit_signal("enemy_turn_started")

func _on_ActionButton_pressed() -> void:
	BU.enemy.hp -= 5
	

