extends CharacterBody2D


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var health: int
var knock_back: int
var move_speed: float

func set_health(_amount: int) -> void:
	health = _amount

func apply_damage(_damage_range: Array) -> void:
	health -= randi_range(_damage_range[0], _damage_range[1])

func apply_heal(_amount: int) -> void:
	health += _amount

func apply_knock_back(_direction: int, _force: int) -> void:
	position.x += _direction * _force

func get_health() -> int:
	return health



