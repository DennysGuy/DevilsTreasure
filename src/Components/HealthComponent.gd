extends Node
class_name HealthComponent

@export
var max_health: float = 10.0

var cur_health: float
# Called when the node enters the scene tree for the first time.
func _ready():
	cur_health = max_health

func get_health() -> float:
	return cur_health

func set_heath(health: float):
	cur_health = health

func apply_damage(attack: Attack):
	cur_health -= randi_range(attack.min_damage, attack.max_damage)

func apply_healing(health: float):
	if self.cur_health + health > self.max_health:
		self.cur_health = self.max_health
	else:
		self.cur_health += health
