extends Node

@export_range(0,1) var drop_percent: float = .5
@export var vial_scene: PackedScene
@export var health_component: Node

func _ready():
	(health_component as HealthComponent).died_signal.connect(on_owner_of_health_component_died)
	
func on_owner_of_health_component_died():
	if vial_scene == null:
		return
	if not owner is Node2D:
		return
	var spawn_position = (owner as Node2D).global_position
	var vial_instance = vial_scene.instantiate() as Node2D
	owner.get_parent().add_child(vial_instance)
	vial_instance.global_position = spawn_position
