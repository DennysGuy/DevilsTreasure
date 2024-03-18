extends Node
class_name VelocityComponent

@export
var move_speed : float
@export
var jump_strength : float

func apply_horizontal_movement(entity : Entity, dir : int):
	self.entity.velocity.x = dir * move_speed

func apply_vertical_movement(entity : Entity):
	self.entity.velocity.y = -jump_strength

func set_move_speed(move_speed : float):
	self.move_speed = move_speed
	
func set_jump_strength(jump_strength : float):
	self.jump_strength = jump_strength
