extends Node2D

const BU = preload("res://OverlapandSystems/BattleUnits.tres")

onready var animation_player: AnimationPlayer = $Position2D/Position2D/AnimationPlayer
onready var health_bar: ProgressBar = $HealthBar
onready var health_label: Label = $HealthLabel


export(int) var damage = 3
export var max_hp = 50 
onready var hp = max_hp setget set_hp

signal dead

func _ready():
	EventBus.connect("enemy_turn_started", self, "_on_enemy_turn_started")
	BU.enemy = self

func _exit_tree():
	BU.enemy = null

#setters
func set_hp(new_hp):
	hp = clamp(new_hp, 0, max_hp)
	if health_bar != null:
		health_bar.value = new_hp
		
#attack func for animation
func attack():
	pass

#deal damage func
func deal_damage():
	if self.hp <= 0:
		emit_signal("dead")
	else:
		BU.player.hp -= damage
#	else:
#		animation_player.play("Hit")
##		if "fire" in status_label.text:
##			hp -= 3
##			print("fire damage", hp)

func dead():
	return hp <= 0


func _on_enemy_turn_started():
	deal_damage()
	EventBus.emit_signal("player_turn_started")

func _on_enemy_dead():
	return hp <= 0

func _on_EnemyBattlerBase_dead() -> void:
	queue_free()
	print("battle_ended")
	EventBus.emit_signal("battle_ended")
