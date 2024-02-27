extends Node

@onready
var player:= get_tree().current_scene.get_node("Player")
@onready
var camera:= get_tree().current_scene.get_node("PlayerCamera")

#player data
var player_health: int = 6
var player_score: int = 0
var keys: int = 0
var bombs: int = 0
var credits: int = 0
var items = {}

func change_room(room_position: Vector2, room_size: Vector2):
	camera.current_room_center = room_position
	camera.current_room_size = room_size
