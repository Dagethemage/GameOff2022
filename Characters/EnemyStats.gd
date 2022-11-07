extends Node

const BU = preload("res://OverlapandSystems/BattleUnits.tres")

export(int) var max_health = 10
onready var health = max_health setget set_health
export(int) var max_mp = 5
onready var mp = max_mp setget set_mp

signal health_changed(value)
signal mp_changed(value)
signal dead

func _ready() -> void:
	EventBus.connect("turn_ended", self, "_on_turn_ended")
	BU.enemy = self

func _exit_tree() -> void:
	BU.enemy = null

func set_health(value):
	health = clamp(value, 0, max_health)

func set_mp(value):
	mp = clamp(value, 0, max_mp)

func deal_damage():
	pass

func take_damage(amount):
	self.health -= amount
	if _dead():
		emit_signal("dead")
		queue_free()

func _dead():
	return health <= 0

func _on_turn_finished():
	EventBus.emit_signal("player_turn_started")
