extends CharacterBody2D

@export var speed = 400 # How fast the player will move (pixels/sec).
@export var fall_acceleration = 400
@export var jump_impulse = -400

var screen_size # Size of the game window.
# The player's movement vector.
var jump_pressed = false
var target_velocity = Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

func get_input(velocity: Vector2):
	'''
	Function for determining player input
	
	Args:
		velocity: Velocity Vector
	Returns:
		velocity
	'''
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	
	# Start Animation if character moved	
	if velocity.length() > 0:
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		
	return velocity

func jump_action(delta: float):
	'''
	Function for Jumping
	
	Args:
		delta: float representing elapsed time between frames
		jump_pressed: bool determining jump action pressed
	Modifies:
		target_velocity.y
	'''
	if not is_on_floor(): # If in the air, fall towards the floor. Literally gravity
		target_velocity.y = target_velocity.y + (fall_acceleration * delta)
		
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		target_velocity.y = jump_impulse
		
	return target_velocity.y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO 
	jump_pressed = false
	
	velocity = get_input(velocity)
#
	target_velocity.x = velocity.x * speed
	target_velocity.y = jump_action(delta)
	
	velocity = target_velocity
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)

	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = false
		# See the note below about boolean assignment.
		$AnimatedSprite2D.flip_h = velocity.x < 0
		
		
	move_and_slide()


func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
