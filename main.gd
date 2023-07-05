extends Node

@export var squake_scene: PackedScene
@export var bullet_scene: PackedScene
var score
var live_squake_limit = 5
var current_squake_count = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# For every squake killed we add a point to the score
func _on_squake_hit():
	print("Squake Hit")
	score += 1
	
func _on_squake_timer_timeout():
	if current_squake_count <= live_squake_limit:
		var squake = squake_scene.instantiate()
		
		var squake_spawn_location = get_node( "SquakePath/SquakeSpawnLocation" )
		squake_spawn_location.progress_ratio = randf()
		
		var direction = squake_spawn_location.rotation + PI/2
		
		squake.position = squake_spawn_location.position
		squake.count = current_squake_count
		
		direction += randf_range(-PI/4, PI/4)
		squake.rotation = direction
		
		var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
		squake.linear_velocity = velocity.rotated(direction)
		
		add_child(squake)
		current_squake_count += 1

func _on_start_timer_timeout():
	pass # Replace with function body.

func game_over():
	$SquakeTimer.stop()

	
func new_game():
	score = 0
	$Sheriff.start( $StartPosition.position )
	$SquakeTimer.start()

func _input(event):
	if event.is_action_pressed("click"):
		var bullet = bullet_scene.instantiate()
		bullet.position = $Sheriff.get_gun_position()
		add_child(bullet)
		bullet.fire_bullet(event.position)

func _on_squake_leaving():
	if current_squake_count > 0:
		current_squake_count -= 1 # Replace with function body.

