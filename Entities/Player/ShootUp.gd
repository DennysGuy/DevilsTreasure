extends State
@export
var idle_state: State
@export
var aim_up_state: State
@export
var timer : Timer

@onready
var bullet = preload("res://props/Projectiles/player_bullet.tscn")
@export
var barrel : Marker2D

var bullet_count := 0

# Called when the node enters the scene tree for the first time.
func enter() -> void:
	super()
	timer.start()
	bullet_count = 1


func process_physics(_delta: float) -> State:
	shoot()
	if timer.is_stopped():
		if Input.is_action_pressed("move_up"):
			return aim_up_state
		else:
			return idle_state
	return null

func shoot():
	var direction 
	if parent.animation_player.flip_h:
		direction = -1
		barrel.position = Vector2(-4,-3)
	else:
		direction = 1
		barrel.position = Vector2(4,-3)
		
	if bullet_count > 0:
		var new_bullet = bullet.instantiate()
		new_bullet.start(barrel.global_position, direction, true)
		get_tree().root.add_child(new_bullet) 
	
	bullet_count -=1
