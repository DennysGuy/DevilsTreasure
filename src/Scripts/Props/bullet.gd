extends CharacterBody2D

var speed := 300
var direction := 0
var damage_range = [1,3]
@export
var bullet : Sprite2D
# Called when the node enters the scene tree for the first time.
func start(_position, _direction, _aim_up: bool):
	direction = _direction
	position = _position
	if _aim_up:
		bullet.rotate(80)
		velocity = Vector2(0,-speed)
	else:
		velocity = Vector2(direction * speed, 0)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	#print(velocity)
	move_and_collide(velocity * delta)


func _on_visible_on_screen_notifier_2d_screen_exited():
	self.queue_free()
	



func _on_bullet_hit_box_body_entered(body):
	pass # Replace with function body.
