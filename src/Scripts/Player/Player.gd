class_name Entity
extends CharacterBody2D

@onready
var animation_player = $animations
@onready
var state_machine = $StateMachine
@export
var camera : Camera2D
@export
var jump_force : int = 300

var has_jumped: bool = false

var in_ladder_area := false

# Called when the node enters the scene tee for the first time.
func _ready() -> void:
	state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)
	
func _process(delta: float) -> void:
	state_machine.process_frame(delta)

func _on_area_2d_body_entered(body):
	self.in_ladder_area = true
	

func _on_area_2d_body_exited(body):
	self.in_ladder_area = false
	

func _on_room_detector_area_entered(area):
	var collision_shape : CollisionShape2D = area.get_node("CollisionShape2D")
	var size: Vector2 = collision_shape.shape.extents*2
	
	Global.change_room(collision_shape.global_position, size)

