extends State

@export
var idle : State

@onready
var timer = $"../../Timer"

@onready
var VelocityComp = $"../../VelocityComponent"

var directions : Array = [-1, 1]
var dir : int
func enter() -> void:
	super()
	VelocityComp.move_speed = 20
	timer.wait_time = 2.0
	dir = directions.pick_random()
	timer.start()
	print("I'm in patrol state")

func process_physics(_delta: float) -> State:
	self.parent.velocity.y += gravity * _delta
	VelocityComp.apply_horizontal_movement(dir)
	self.parent.move_and_slide()
	
	if timer.time_left == 0:
		return idle
	
	return null

