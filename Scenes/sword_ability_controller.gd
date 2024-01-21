extends Node

const MAX_RANGE  = 150
@export var sword_from_inspector: PackedScene
const sword_preload  = preload("res://Scenes/sword.tscn")
@onready var timer_01 = $Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	#get_node("Node/Timer")
	$Timer.timeout.connect(on_timer_timeout)

func on_timer_timeout():
	#var player = get_tree().get_first_node_in_group("player")
	var player = get_tree().get_first_node_in_group("player") as Node2D
	if player == null:
		return
	
	
	var enemies = get_tree().get_nodes_in_group("enemies") #get array of enemies
	#enemies = enemies.filter() #create a new array from filtered elements which method returned true


	enemies = enemies.filter(func(e: Node2D):
		return e.global_position.distance_squared_to(player.global_position) < MAX_RANGE**2
		)
	
	if enemies.size() == 0:
		return
		
	enemies.sort_custom(func(a:Node2D, b:Node2D):
		var a_dist = a.global_position.distance_squared_to(player.global_position) 
		var b_dist = b.global_position.distance_squared_to(player.global_position) 
		return a_dist < b_dist
		)
		
	
	var sword_instance = sword_from_inspector.instantiate() as Node2D
	player.get_parent().add_child(sword_instance)
	
	sword_instance.global_position = enemies[0].global_position
	sword_instance.global_position +=Vector2.RIGHT.rotated(randf_range(0,TAU))
	
	var enemy_direction = enemies[0].global_position - sword_instance.global_position
	sword_instance.rotation = enemy_direction.angle()
	
	
	
	##get_tree().current_scene.add_child(sword_instance1)
	#
	#sword_instance1.global_position = player.global_position
	##sword_instance2.global_position = player.global_position +  Vector2(10,0)
