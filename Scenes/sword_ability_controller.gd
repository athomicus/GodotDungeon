extends Node
@export var sword_from_inspector: PackedScene
const sword_preload  = preload("res://Scenes/sword.tscn")
@onready var timer_01 = $Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	#get_node("Node/Timer")
	$Timer.timeout.connect(on_timer_timeout)

func on_timer_timeout():
	#var player = get_tree().get_first_node_in_group("player")
	var player = $"../.."
	
	if player == null:
		return
	
	var sword_instance1 = sword_from_inspector.instantiate()
	var sword_instance2 = sword_preload.instantiate()
	
	get_tree().current_scene.add_child(sword_instance1)
	player.get_parent().add_child(sword_instance2)
	sword_instance1.global_position = player.global_position
	sword_instance2.global_position = player.global_position +  Vector2(10,0)
