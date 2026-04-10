extends CharacterBody3D


const SPEED = 2
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _init():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	#movement
	
	velocity.z = Input.get_axis("forward","back")*cos(rotation.y) - Input.get_axis("left","right")*sin(rotation.y)
	velocity.x = Input.get_axis("forward","back")*sin(rotation.y) + Input.get_axis("left","right")*cos(rotation.y)
	velocity = velocity*SPEED
	
	
	#looking
	rotate_y(-Input.get_last_mouse_velocity().x / get_viewport().size.x /20)
	$Camera3D.rotate_x(-Input.get_last_mouse_velocity().y / get_viewport().size.y / 20)


	move_and_slide()
