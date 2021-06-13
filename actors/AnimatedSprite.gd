extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var anim = ["stand", "big sad", "walk", "jump"]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

var g_velocity: float = 0.0

func _process(delta: float) -> void:
	position.x += g_velocity * delta
	# Destroy object at 100 for now
	if position.x < 100:
		get_parent().remove_child(self)
		queue_free()

func start(velocity: float) -> void:
	g_velocity = velocity
	play(anim[randi() % 4])
	flip_h = randi() % 2 == 0


func _on_AnimatedSprite_animation_finished():
	if animation == 'big sad':
		play('stand')


