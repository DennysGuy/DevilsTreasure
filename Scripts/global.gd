extends Node

@onready
var player:= get_tree().current_scene.get_node("Player")
@onready
var camera:= get_tree().current_scene.get_node("PlayerCamera")

func change_room(room_position: Vector2, room_size: Vector2):
	camera.current_room_center = room_position
	camera.current_room_size = room_size
	print(camera.current_room_center)
	print(camera.current_room_size)
