extends CharacterBody2D
const SPEED = 300.0
const MAX_SPEED = 200
const ACCELERATION_SMOOTHING = 25 

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	var movement_vector = get_movement_vector()
	var direction = movement_vector.normalized()
	var target_velocity = direction * MAX_SPEED
	#velocity = lerp(velocity,target_velocity,1-exp(-delta*ACCELERATION_SMOOTHING))
	velocity = velocity.lerp(target_velocity,1-exp(-delta*ACCELERATION_SMOOTHING))
	move_and_slide()
 

func get_movement_vector():
	var x_movement = Input.get_action_strength("right") - Input.get_action_strength("left")
	var y_movement = Input.get_action_strength("down") - Input.get_action_strength("up")
	return Vector2(x_movement,y_movement)
	

