extends State

@export
var fall_state: State
@export
var move_state: State
@export
var idle_state: State

@export
var climb_state: State

@onready
var bullet = preload("res://src/Props/Projectiles/player_bullet.tscn")

@export
var barrel : Marker2D

func enter() -> void:
	super()
	parent.has_jumped = true
	parent.velocity.y -= parent.jump_force


	

func process_input(_event: InputEvent) -> State:
		
	if Input.is_action_just_pressed("move_up") and parent.in_ladder_area:
		return climb_state
	
	return null

func process_physics(_delta: float) -> State:
	parent.velocity.y += gravity * _delta
	
	if parent.velocity.y > 0:
		return fall_state
	
	var movement = Input.get_axis("move_left","move_right") * move_speed
	if movement != 0:
		parent.animation_player.flip_h = movement < 0
	parent.velocity.x = movement
	parent.move_and_slide()
	
	#shoot in air
	if Input.is_action_just_pressed("shoot"):
		self.shoot()

	
	if parent.is_on_floor():
		return idle_state
	
	return null

func shoot():
	var direction 
	if parent.animation_player.flip_h:
		direction = -1
		barrel.position = Vector2(-5,-5)
	else:
		direction = 1
		barrel.position = Vector2(5,-5)
			
		
	var new_bullet = bullet.instantiate()
	new_bullet.start(barrel.global_position, direction, false)
	get_tree().root.add_child(new_bullet) 
