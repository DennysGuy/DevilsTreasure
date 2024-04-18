extends State

@export
var idle : State

@onready
var timer = $"../../Timer"

@onready
var VelocityComponent = $"../../VelocityComponent"

var directions : Array = [-1, 1]
var dir : int
func enter() -> void:
	super()
	timer.wait_time = 2.0
	dir = directions.pick_random()
	timer.start()

func process_physics(_delta: float) -> State:
	
	VelocityComponent.apply_horizontal_movement(dir)
	
	if timer.is_stopped():
		return idle
	
	return null

