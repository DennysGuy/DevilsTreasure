extends State

@export
var patrol : State

@onready
var timer = $"../../Timer"

@onready
var VelocityComp = $"../../VelocityComponent"
@onready
var direction_comparator = $"../../DirectionComparator"
@onready
var no_zone_detector = $"../../NoZoneDetector"

func enter() -> void:
	print("I'm in idle state")
	super()
	
	var dir = direction_comparator.target_position.x
	if no_zone_detector.is_colliding() and no_zone_detector.target_position.x == dir:
		direction_comparator.target_position.x = dir * -1
	
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


