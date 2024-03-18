extends Area2D

@export
var damage_receiver: String

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.has_node(damage_receiver):
		body.apply_damage(get_parent().damage_range)
		print(body.get_health())
		get_parent().queue_free()
