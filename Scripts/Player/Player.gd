class_name Entity
extends CharacterBody2D

@onready
var animation_player = $animations
@onready
var state_machine = $StateMachine


var in_ladder_area := false

# Called when the node enters the scene tree for the first time.
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
	