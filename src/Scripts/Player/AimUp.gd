extends State

@export
var idle_state: State
@export
var shoot_up_state: State

@onready
var bullet = preload("res://src/Props/Projectiles/player_bullet.tscn")

func enter() -> void:
	super()

func process_input(_event: InputEvent) -> State:
		
	if Input.is_action_just_pressed("shoot"):
		return shoot_up_state
	
	if Input.is_action_just_released("move_up"):
		return idle_state
	
	return null
