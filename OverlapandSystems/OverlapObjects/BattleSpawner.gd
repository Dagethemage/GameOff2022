extends Position2D

export(Array, PackedScene) var enemy = []

func _ready() -> void:
	EventBus.connect("battle_started", self, "_on_battle_started")
	randomize()

func spawn():
	enemy.shuffle()
	var Enemy = enemy.front()
	var enemy_spawn = Enemy.instance()
	add_child(enemy_spawn)


func _on_battle_started():
	spawn()
