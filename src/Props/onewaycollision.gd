extends StaticBody2D

@onready
var player: CharacterBody2D = get_tree().current_scene.get_node("Player")
@onready
var ladder_detector = player.get_node("LadderDetector")
@onready
var collision_shape: CollisionShape2D = get_node("CollisionShape2D")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	if player.position.y > position.y:
		collision_shape.disabled = true
	else:
		collision_shape.disabled = false

	if Input.is_action_just_pressed("move_down") and ladder_detector.is_colliding():
		collision_shape.disabled = true
