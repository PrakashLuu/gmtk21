extends Sprite

var g_texture_width: float = 0.0
var g_velocity: float = 0.0

func _ready():
	g_texture_width = texture.get_size().x * scale.x

func _process(delta: float) -> void:
	position.x += g_velocity
	if position.x < -g_texture_width:
		position.x += 2 * g_texture_width

func set_velocity(velocity: float) -> void:
	g_velocity = velocity
