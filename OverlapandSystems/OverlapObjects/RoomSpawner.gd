extends Position2D

export(Array, PackedScene) var enemy = []

func _ready() -> void:
	randomize()
	spawn()

func spawn():
	enemy.shuffle()
	var Enemy = enemy.front()
	var enemy_spawn = Enemy.instance()
	add_child(enemy_spawn)


