extends CharacterBody2D


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var health: int
var move_speed: float

func set_health(_amount: int) -> void:
	health = _amount

func apply_damage(_damage_range: Array) -> void:
	health -= randi_range(_damage_range[0], _damage_range[1])

func apply_heal(_amount: int) -> void:
	health += _amount

# will need to rewrite so that enemy can be knocked back in any direction (up down left right)
func apply_knock_back(_position: Vector2, _new_position: Vector2, _force: int) -> void:
	position = lerp(_position, _new_position, _force)

func get_health() -> int:
	return health



