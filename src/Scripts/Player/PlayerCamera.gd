extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	set_limit(limit_left, 0)
	set_limit(limit_right, 160)
	set_limit(limit_top, 0)
	set_limit(limit_bottom, 144)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
