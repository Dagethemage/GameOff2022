extends Control

onready var starting_actions_menu: VBoxContainer = $StartingActionsMenu
onready var attack_actions: VBoxContainer = $AttackActions
onready var items: VBoxContainer = $Items



func _ready() -> void:
	EventBus.connect("battle_started", self, "_on_battle_started")
	EventBus.connect("battle_ended", self, "_on_battle_ended")
	EventBus.connect("enemy_turn_started", self, "_on_enemy_turn_started")
	EventBus.connect("player_turn_started", self, "_on_player_turn_started")
	EventBus.connect("turn_ended", self, "_on_turn_ended")


func _on_Attack_pressed() -> void:
	attack_actions.show()
	starting_actions_menu.hide()


func _on_Items_pressed() -> void:
	items.show()
	starting_actions_menu.hide()
