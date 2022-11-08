extends Node2D

const BU = preload("res://OverlapandSystems/BattleUnits.tres")

onready var animation_player: AnimationPlayer = $Position2D/Position2D/AnimationPlayer
onready var health_bar: ProgressBar = $HealthBar
onready var health_label: Label = $HealthLabel


export(int) var damage = 3
export var max_hp = 50 
onready var hp = max_hp setget set_hp

func _ready():
	EventBus.connect("turn_ended", self, "_on_action_finished")
	BU.enemy = self

func _exit_tree():
	BU.enemy = null

#setters
func set_hp(new_hp):
	hp = new_hp
	if health_bar != null:
		health_bar.value = new_hp
#attack func for animation
func attack():
	pass

#deal damage func
func deal_damage():
	BU.player.health -= damage

func take_damage(amount):
	self.hp -= amount
	if dead():
		print("dead")
		emit_signal("dead")
		queue_free()
#	else:
#		animation_player.play("Hit")
##		if "fire" in status_label.text:
##			hp -= 3
##			print("fire damage", hp)

func dead():
	return hp <= 0
