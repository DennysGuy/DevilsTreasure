class_name Attack

var min_damage : int
var max_damage : int
var knockback : int
var position : Vector2
var stun_time : int

func set_min_damage(amount : int):
	self.min_damage = amount

func set_max_damage(amount : int):
	self.max_damage = amount

func set_knockback(amount: int):
	self.knockback = amount

func set_position(position: Vector2):
	self.position = position
	
func set_stun_time(amount : int):
	self.stun_time = amount
