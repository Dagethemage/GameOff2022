extends Node2D

enum {
	IDLE,
	NEW_DIRECTION,
	MOVE,
	CHASE
}

const SPEED = 100
var state = MOVE
var direction = Vector2.RIGHT

func _ready() -> void:
	EventBus.connect("battle_ended", self, "_on_battle_ended")
	randomize()

func _process(delta: float) -> void:
	match state:
		IDLE:
			pass
		NEW_DIRECTION:
			direction = choose([Vector2.RIGHT, Vector2.UP, Vector2.LEFT, Vector2.DOWN])
			state = choose([IDLE, MOVE])
		MOVE:
			move(delta)
		CHASE:
			chase()

func move(delta):
	position += direction * SPEED * delta
	if direction == Vector2.RIGHT:
		$WatchRadius.rotation_degrees = 0
	elif direction == Vector2.LEFT:
		$WatchRadius.rotation_degrees = -180
	elif direction == Vector2.UP:
		$WatchRadius.rotation_degrees = 270
	elif direction == Vector2.DOWN:
		$WatchRadius.rotation_degrees = 90

func choose(array):
	array.shuffle()
	return array.front()

func chase():
	pass

func _on_battle_ended():
	pass

func _on_Timer_timeout() -> void:
	$Timer.wait_time = choose([0.5, 1, 1.5])
	state = choose([IDLE, NEW_DIRECTION])


func _on_WatchRadius_body_entered(body: Node) -> void:
	if "Player" in body.name:
		print("battle")
		EventBus.emit_signal("battle_started")
