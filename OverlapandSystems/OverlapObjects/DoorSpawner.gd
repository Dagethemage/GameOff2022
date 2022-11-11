extends Position2D

export(Array, PackedScene) var doors = []

func _ready() -> void:
	randomize()
	spawn()

func spawn():
	doors.shuffle()
	var Door = doors.front()
	var Doors = Door.instance()
	add_child(Doors)
