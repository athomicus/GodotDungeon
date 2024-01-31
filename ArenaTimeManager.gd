extends Node

@onready var timer = $Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func get_time_elapsed():
	return timer.wait_time - timer.time_left #how much time we have to end
