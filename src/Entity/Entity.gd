class_name Entity
extends CharacterBody2D

@onready
var animation_player = $animations
@onready
var state_machine = $StateMachine

# Called when the node enters the scene tee for the first time.
func _ready() -> void:
	state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)
	
func _process(delta: float) -> void:
	state_machine.process_frame(delta)
