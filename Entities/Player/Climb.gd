extends State

@export
var idle_state: State
@export
var jump_state: State
@export
var fall_state: State

func enter() -> void:
	super()
	parent.velocity.x = 0
	move_speed = 80

func process_input(_event: InputEvent) -> State:
	if Input.is_action_just_pressed("jump"):
		return jump_state
	return null

func process_physics(_delta: float) -> State:
	
	var input = Input.get_axis("move_up","move_down")
	var movement = input * move_speed

	parent.velocity.y = movement

	parent.move_and_slide()

	if parent.is_on_floor():
		return idle_state
	
	if !parent.in_ladder_area and !parent.is_on_floor():
		return fall_state
	
	
	return null
