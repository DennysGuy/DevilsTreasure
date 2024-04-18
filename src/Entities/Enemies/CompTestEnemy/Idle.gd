extends State

@export
var patrol : State

@onready
var timer = $"../../Timer"

@onready
var VelocityComp = $"../../VelocityComponent"

func enter() -> void:
	print("I'm in idle state")
	super()
	timer.wait_time = 3.0
	VelocityComp.move_speed = 0
	timer.start()

func process_physics(_delta: float) -> State:
	VelocityComp.apply_horizontal_movement(1)
	self.parent.velocity.y += gravity * _delta
	self.parent.move_and_slide()
	if timer.time_left == 0:
		return patrol
	
	return null


