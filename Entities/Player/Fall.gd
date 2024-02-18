extends State

@export
var idle_state: State
@export
var move_state: State
@export
var climb_state: State

func process_input(_event: InputEvent) -> State:
		
	if Input.is_action_just_pressed("move_up") and parent.in_ladder_area:
		print("in climb state")
		return climb_state
	
	return null

func process_physics(_delta: float) -> State:
	parent.velocity.y += gravity * _delta
	
	var movement = Input.get_axis("move_left", "move_right") * move_speed
	parent.velocity.x = movement
	parent.move_and_slide()
	
	if parent.is_on_floor():
		if movement != 0:
			return move_state
		else:
			return idle_state
	
	return null
