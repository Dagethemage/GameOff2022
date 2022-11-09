extends Node

const BU = preload("res://OverlapandSystems/BattleUnits.tres")

export var max_hp = 250
onready var hp = max_hp setget set_hp
#export var max_ap = 3
#var ap = max_ap setget set_ap
export var max_mp = 125
onready var mp = max_mp setget set_mp
#export var max_stress = 75
#var stress = max_stress setget set_stress

signal hp_changed(value)
signal ap_changed(value)
signal mp_changed(value)
signal stress_changed(value)

func _ready():
	BU.player = self

func _exit_tree():
	BU.player = null

func set_hp(value):
	hp = clamp(value, 0, max_hp)
	emit_signal("hp_changed", hp)

#func set_ap(value):
#	ap = clamp(value, 0, max_ap)
#	emit_signal("ap_changed", ap)
#	if ap <= 0:
#		EventBus.emit_signal("enemy_turn_started")


func set_mp(value):
	mp = clamp(value, 0, max_mp)
	emit_signal("mp_changed", mp)

#func set_stress(value):
#	stress = clamp(value, 0, max_stress)
#	emit_signal("stress_changed", stress)


