extends CharacterBody2D

@export 
var player: Entity
@onready
var muzzle = $Muzzle
var player_bullet = preload("res://props/Projectiles/player_bullet.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func get_input():
		if Input.is_action_just_pressed("fire"):
			shoot()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.get_input()
	self.rotate(self.get_angle_to(self.get_global_mouse_position()))
	

func shoot():
	var bullet = player_bullet.instantiate()
	bullet.start(muzzle.global_position, rotation)
	get_tree().root.add_child(bullet)
