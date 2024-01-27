extends Node

const SPAWN_RADIUS = 240
@export var basic_enemy_scene: PackedScene
var player

func _ready():
	$Timer.timeout.connect(on_timer_timeout)
	player = get_tree().get_first_node_in_group("player")
	

func on_timer_timeout():
	if player == null:
		return
		#viewport 384x216, but ovveride is 1280 x 720
	var random_direction = Vector2.RIGHT.rotated(randf_range(0,TAU))
	var spawn_position = player.global_position + random_direction * SPAWN_RADIUS
	var enemy = basic_enemy_scene.instantiate()
	get_tree().current_scene.add_child(enemy)
	enemy.global_position = spawn_position
