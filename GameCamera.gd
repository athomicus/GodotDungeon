extends Camera2D

var target_position = Vector2.ZERO


# Called every frame. 'delta' is the elapsed time since the previous frame.
#  _process(delta):
func _physics_process(delta):
	var player_nodes = get_tree().get_nodes_in_group("player")
	if player_nodes.size() > 0:
		var player = player_nodes[0] as Node2D
		target_position = player.global_position
		global_position = global_position.lerp(target_position, 1.0 - exp(-delta * 10))
