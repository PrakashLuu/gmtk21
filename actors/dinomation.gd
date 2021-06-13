extends AnimationPlayer


# Declare member variables here. Examples:
var anim = ["bigsad","move","idle","kick","sprint"]


onready var dino = get_node("../dino")
var counter = 7


func _process(delta: float) -> void:
	counter += 1
	if (counter % 60) == 0:
		play(anim[randi() % 5])
	if (counter % 30) == 0:
		if is_instance_valid(dino):
			dino.flip_h = randi() % 2 == 0
