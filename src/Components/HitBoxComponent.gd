extends Area2D
class_name HitBox

var attack_stats : Attack

@export
var parent : Entity

@export
var min_damage : int = 1
@export
var max_damage : int = 2
@export
var knock_back_amount : float = 2.0
@export
var stun_time : int = 0

func _ready():
	attack_stats.set_min_damage(min_damage)
	attack_stats.set_max_damage(max_damage)
	attack_stats.set_position(parent.global_position)
	attack_stats.set_stun_time(stun_time)
