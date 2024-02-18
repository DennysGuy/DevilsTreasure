extends State

@export
var idle_state: State
@export
var jump_state: State
@export
var fall_state: State
@export
var climb_state: State

@onready
var ladder = get_tree().current_scene.find_child("Ladder")

func enter() -> void:
	super()
	parent.velocity.x = 0
	move_speed = 600

func process_input(_event: InputEvent) -> State:
	if Input.is_action_just_pressed("jump") and parent.is_on_floor():
		print("jumping")
		return jump_state
	
	if Input.is_action_just_pressed("move_up") and parent.in_ladder_area:
		print("in climb state")
		return climb_state
	
	return null


func process_physics(_delta: float) -> State:
	parent.velocity.y += gravity * _delta
	
	var input = Input.get_axis("move_left","move_right")
	var movement = input * move_speed

	parent.velocity.x = movement
	#set floor snapping for sloped surfaces
	parent.set_floor_snap_length(30)
	parent.apply_floor_snap()
	parent.move_and_slide()
	
	
	if  input == 0:
		return idle_state
	
	if !parent.is_on_floor():
		return fall_state
	
	return null

