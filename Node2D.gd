extends Node2D


func print_args(arg1, arg2, arg3 = "t"):
	prints(arg1, arg2, arg3)



# Called when the node enters the scene tree for the first time.
func _ready():
	var callable = Callable(self, "print_args")
	callable.call( 1,2 )
	var mouse = $mouse
	
	var sword = $sword
	#mouse.global_position = Vector2(5,5)
	#player.global_postion = Vector2(0,0)
	
	
	#sword.global_position = mouse.global_position
	var enemy_direction = mouse.global_position - sword.global_position
	sword.rotation = enemy_direction.angle() 
	
	var a =sword.global_position
	var b  = mouse.global_position
	var rotation_ab = a.angle_to_point(b)
	print( rad_to_deg( sword.rotation), " a->b: ", rad_to_deg(rotation_ab)  )
	
	

