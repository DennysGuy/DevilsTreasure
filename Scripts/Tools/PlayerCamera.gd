extends Camera2D

@onready
var room1: Area2D = get_parent().get_node("Room1")
@onready
var room1_collision: CollisionShape2D = get_parent().get_node("Room1/CollisionShape2D")

@onready
var player: CharacterBody2D = get_parent().get_node("Player")
# Called when the node enters the scene tree for the first time.
func _ready():
	var x_center: float = room1_collision.shape.extents.x
	var y_center: float = room1_collision.shape.extents.y
	set_limit(SIDE_LEFT, room1.position.x)
	set_limit(SIDE_RIGHT, x_center*2)
	set_limit(SIDE_BOTTOM, room1.position.y - y_center*2)
	set_limit(SIDE_TOP, room1.position.y)
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = player.position
