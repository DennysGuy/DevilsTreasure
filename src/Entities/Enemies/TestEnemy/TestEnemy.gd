extends "res://src/Scripts/Enities/Mob.gd"
var speed = 0
var landing_position

@onready
var HurtBox : Area2D = $HurtBox
# Get the gravity from the project settings to be synced with RigidBody nodes.
func _ready():
	self.set_health(15)
	landing_position = position.x+10
func _process(delta):
	if health <= 0:
		self.queue_free()

func _physics_process(delta):
	velocity.y += gravity * delta
	
	#var dir: int = -1 
	#var new_position = Vector2(landing_position,position.y)
	#
	#speed += delta*0.1
	#position = position.lerp(new_position, speed)
	#print(landing_position)
	move_and_slide()
	
	if HurtBox.has_overlapping_areas():
		var area: Area2D = HurtBox.get_overlapping_areas().pop_back()
		var bullet = area.get_parent()
		if area.name == "BulletArea":
			self.apply_damage(bullet.damage_range)
			print(health)
			area.get_parent().queue_free()
			
			#return hurt_state
	#print(HurtBox.get_parent().get_child_count())
	
#func _on_hit_detector_area_entered(area):
	#var bullet = area.get_parent()
	#if area.name == "BulletArea":
		
		#modulate = Color(1,0,0)
		#var dir: int = 1 if bullet.velocity.x > 0 else -1
		#var new_position = Vector2(dir*(bullet.position.x+60),0)
		#print(new_position)
		#apply_knock_back(position,new_position,0.5)
		#area.get_parent().queue_free()
