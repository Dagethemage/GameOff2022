extends Button

const BU = preload("res://OverlapandSystems/BattleUnits.tres")

func _ready() -> void:
	pass

func _on_ActionButton_pressed() -> void:
	BU.enemy.hp -= 25
	print(BU.enemy.hp)
	yield(get_tree().create_timer(.02), "timeout")
	EventBus.emit_signal("enemy_turn_started")
	

