extends Camera2D

var follow_smoothing: float = 0.2
var smoothing: float
var current_room_center: Vector2
var current_room_size: Vector2
var hud_height = 16*2
@onready
var view_size: Vector2 = get_viewport_rect().size

var zoom_view_size: Vector2

@onready
var player: CharacterBody2D = get_parent().get_node("Player")
@onready
var timer: Timer = get_parent().get_node("Timer")
# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start()
	smoothing = 1
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if timer.is_stopped():
		smoothing = follow_smoothing
	zoom_view_size = view_size * zoom
	var target_position := calculate_target_position(current_room_center, current_room_size)
	position = lerp(position, target_position, smoothing)

func calculate_target_position(room_center: Vector2, room_size: Vector2) -> Vector2:
	var x_margin: float = (room_size.x - zoom_view_size.x)/2
	var y_margin: float = (room_size.y - zoom_view_size.y)/2 
	
	var return_position: Vector2 = Vector2.ZERO
	if x_margin <= 0:
		return_position.x = room_center.x
		
	else:
		var left_limit: float = room_center.x - x_margin
		var right_limit: float = room_center.x + x_margin
		return_position.x = clamp(Global.player.position.x, left_limit, right_limit)

	if y_margin <= 0:
		return_position.y = room_center.y
	
	else:
		var top_limit = room_center.y - (y_margin)
		var bot_limit = room_center.y + (y_margin)
		return_position.y = clamp(Global.player.position.y, top_limit, bot_limit)
	

	return return_position
	
