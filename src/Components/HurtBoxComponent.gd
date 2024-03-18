extends Area2D
class_name HurtBox

@export
var parent : Entity
@export
var health_component : HealthComponent

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func bullet_detected(hitbox : HitBox, state : State) -> bool:
	if self.has_overlapping_areas():
		hitbox.parent.queue_free()
		return true
	
	return false
