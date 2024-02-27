class_name State
extends Node

@export
var animation_name: String
@export
var move_speed : int = 600


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var parent: Entity

func enter() -> void:
	parent.animation_player.play(animation_name)
	pass

func exit() -> void:
	pass

func process_input(_event: InputEvent) -> State:
	return null

func process_frame(_delta: float) -> State:
	return null

func process_physics(_delta: float) -> State:
	return null
		
