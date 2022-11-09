extends Node2D



func _ready() -> void:
	EventBus.connect("battle_started", self, "_on_battle_started")
	EventBus.connect("battle_ended", self, "_on_battle_ended")
#	EventBus.connect("player_turn_started", self, "_on_player_turn_started")
#	EventBus.connect("enemy_turn_started", self, "_on_enemy_turn_started")


func _on_battle_started():
	$BattleUI.show()
	get_tree().paused = true

func _on_battle_ended():
	$BattleUI.hide()
	get_tree().paused = false

#func _on_player_turn_started():
#	$BattleUI.show()
#
#func _on_enemy_turn_started():
#	$bat
