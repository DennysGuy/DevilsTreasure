extends State

@export
var patrol : State

@onready
var timer = $"../../Timer"

func enter() -> void:
	super()
	timer.wait_time = 3.0
	timer.start()

func process_physics(_delta: float) -> State:
	if timer.is_stopped():
		return patrol
	
	return null


