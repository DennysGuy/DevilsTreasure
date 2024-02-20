extends CharacterBody2D

var speed := 300
var direction := 0
# Called when the node enters the scene tree for the first time.
func start(_position, _direction):
	direction = _direction
	position = _position
	velocity = Vector2(direction * speed, 0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		if collision.get_collider().has_method("hit"):
			collision.get_collider().hit()




func _on_visible_on_screen_notifier_2d_screen_exited():
	self.queue_free()
	print("bullet deleted")
