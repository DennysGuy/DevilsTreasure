extends State

@export
var jump_state: State
@export
var fall_state: State
@export
var move_state: State
@export
var climb_state: State
@export
var shoot_state: State
@export
var aim_up_state: State

@export
var ladder_detector: RayCast2D

func enter() -> void:
	super()
	move_speed = 600

func process_input(_event: InputEvent) -> State:
	
	var key_pressed: bool = _event.is_action_pressed("move_left") or _event.is_action_pressed("move_right")
	
	if key_pressed and parent.is_on_floor():
		return move_state
	
	if Input.is_action_just_pressed("jump"):
		return jump_state
	

	if Input.is_action_pressed("move_up") and !parent.in_ladder_area:
		return aim_up_state
	
	if Input.is_action_just_pressed("shoot"):
		return shoot_state
	
	return null

func process_physics(_delta: float) -> State:
	print(ladder_detector.is_colliding())
	parent.velocity.y += gravity * _delta
	
	var movement = Input.get_axis("move_left","move_right")
	#checks the input while idle state for being pressed; if pressed return to move state

	if Input.is_action_just_pressed("move_up") and parent.in_ladder_area or Input.is_action_pressed("move_down") and ladder_detector.is_colliding():
		return climb_state

	if movement != 0 and parent.is_on_floor():
		return move_state
	
	
	
	#parent.velocity.x = 0
	parent.move_and_slide()
	
	if !parent.is_on_floor():
		return fall_state
	
	return null
