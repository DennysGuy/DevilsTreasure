extends State

@export
var jump_state: State
@export
var fall_state: State
@export
var move_state: State

func process_input(_event: InputEvent) -> State:
	
	var key_pressed: bool = _event.is_action_pressed("move_left") or _event.is_action_pressed("move_right")
	
	if key_pressed and parent.is_on_floor():
		return move_state
	
	if Input.is_action_just_pressed("jump"):
		return jump_state
	
	return null

func process_physics(_delta: float) -> State:
	parent.velocity.y += gravity * _delta
	
	var movement = Input.get_axis("move_left","move_right")
	#checks the input while idle state for being pressed; if pressed return to move state
	if movement != 0 and parent.is_on_floor():
		return move_state
	
	#parent.velocity.x = 0
	parent.move_and_slide()
	
	if !parent.is_on_floor():
		return fall_state
	
	return null
