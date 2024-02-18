extends State

@export
var jump_state: State
@export
var fall_state: State
@export
var move_state: State
@export
var climb_state: State

@onready
var ladder = get_tree().current_scene.find_child("Ladder")

func enter() -> void:
	super()
	move_speed = 600
	
func process_input(_event: InputEvent) -> State:
	
	var key_pressed: bool = _event.is_action_pressed("move_left") or _event.is_action_pressed("move_right")
	
	if key_pressed and parent.is_on_floor():
		return move_state
	
	if Input.is_action_just_pressed("jump"):
		return jump_state
	
	if Input.is_action_just_pressed("move_up") and parent.in_ladder_area:
		print("in climb state")
		return climb_state
	
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
