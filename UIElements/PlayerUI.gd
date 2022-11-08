extends Control

const BU = preload("res://OverlapandSystems/BattleUnits.tres")

onready var health_bar: ProgressBar = $HealthBar
onready var mana_bar: ProgressBar = $ManaBar



func _ready() -> void:
	EventBus.connect("player_dead", self, "_on_player_dead")
	

func _on_player_dead():
	var stats = BU.player
	return stats.health <= 0

func _on_PlayerStats_hp_changed(value) -> void:
	var stats = BU.player
	health_bar.value = value
	if stats.health <= 0:
		_on_player_dead()
		queue_free()


func _on_PlayerStats_mp_changed(value) -> void:
	mana_bar.value = value
