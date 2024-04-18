extends State

@export
var idle : State

@onready
var timer = $"../../Timer"

@onready
var velocity_component = $"../../VelocityComponent"

@onready
var no_zone_detector = $"../../NoZoneDetector"
@onready
var direction_compartor = $"../../DirectionComparator"


var directions : Array = [-1, 1]
var dir : int
func enter() -> void:
	super()
	velocity_component.move_speed = 20
	timer.wait_time = 2.0
	
	if parent.animation_player.flip_h and no_zone_detector.is_colliding():
		dir = -1
	elif !parent.animation_player.flip_h and no_zone_detector.is_colliding():
		dir = 1
	else:
		dir = directions.pick_random()
	print(no_zone_detector.target_position.x/18)
	print(int(parent.animation_player.flip_h))
	timer.start()
	print("I'm in patrol state")

func process_physics(_delta: float) -> State:
	self.parent.velocity.y += gravity * _delta
	
	velocity_component.apply_horizontal_movement(dir)
	
	if no_zone_detector.is_colliding() and int(direction_compartor.target_position.x/18) == int(no_zone_detector.target_position.x/18) :
		direction_compartor.target_position.x = (dir * 18) * -1
		return idle
	
	parent.animation_player.flip_h = dir > 0
	
	if dir == -1:
		no_zone_detector.target_position.x = -18
		direction_compartor.target_position.x = -18
	else:
		no_zone_detector.target_position.x = 18
		direction_compartor.target_position.x = 18
	
	self.parent.move_and_slide()
	
	if timer.time_left == 0:
		return idle
	
	return null

