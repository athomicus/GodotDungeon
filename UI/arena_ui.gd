extends CanvasLayer

@export var arena_time_manager: Node
@onready var label = $MarginContainer/Label
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if arena_time_manager == null:
		return
	var time_elapsed = arena_time_manager.get_time_elapsed()
	label.text = format_second_to_string(time_elapsed)
	#$MarginContainer/Label.text = str(time_elapsed)

func format_second_to_string(sec: float):
	var minutes = floor(sec / 60) #var a = floor(2.99) # a is 2.0
	var remaining_seconds = sec - (minutes * 60)
	#return str(minutes) + " : " + str(floor(remaining_seconds))
	return str(minutes) + ":" + "%02d" % floor(remaining_seconds) #"%02d" 2points after decimal point 
