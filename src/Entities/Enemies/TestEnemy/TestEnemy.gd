extends "res://src/Scripts/Enities/Mob.gd"

# Get the gravity from the project settings to be synced with RigidBody nodes.
func _ready():
	self.set_health(15)

func _process(delta):
	if health <= 0:
		self.queue_free()

func _physics_process(delta):
	velocity.y += gravity * delta
	
	move_and_slide()


func _on_hit_detector_area_entered(area):
	var bullet = area.get_parent()
	if area.name == "BulletArea":
		self.apply_damage(bullet.damage_range)
		print(health)
		modulate = Color(1,0,0)
		var dir: int = 1 if bullet.velocity.x > 0 else -1
		var new_position = Vector2(dir*(bullet.position.x+60),0)
		print(new_position)
		apply_knock_back(position,new_position,0.5)
		area.get_parent().queue_free()
