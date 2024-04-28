extends CharacterBody2D

# bullet signal 
signal shoot(pos: Vector2, direction: bool)

#shoot mechanism 
var has_bullet := true
var facing_right := true

const SPEED = 100.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animation_sprite = $AnimatedSprite2D


func _physics_process(delta):
	# callback 
	get_input()
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		animation_sprite.animation = "jump"
	else:
		if(velocity.x == 0):
			animation_sprite.animation = "default"
		else:
			animation_sprite.animation = "run"

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
			

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction:
		velocity.x = direction * SPEED
		
		#hflip 
	if(velocity.x < 0):
		animation_sprite.flip_h = true
	elif(velocity.x > 0):
		animation_sprite.flip_h = false
		
	else:
		velocity.x = move_toward(velocity.x, 0, 10)

	move_and_slide()
 
func get_input():
	if Input.is_action_just_pressed("shoot"):
		shoot.emit(global_position, facing_right)

	# Replace with function body.
