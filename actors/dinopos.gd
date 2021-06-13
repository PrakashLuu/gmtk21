extends Node2D


# Declare member variables here. Examples:
var g_velocity: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += g_velocity * delta
	# Destroy object at 100 for now
	if position.x < 100:
		get_parent().remove_child(self)
		queue_free()

func start(velocity: float) -> void:
	g_velocity = velocity
