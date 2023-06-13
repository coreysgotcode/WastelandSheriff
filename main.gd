extends Node

@export var squake_scene: PackedScene
var score
var live_squake_limit = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# For every squake killed we add a point to the score
func _on_squake_hit():
	score += 1
	
func _on_squake_timer_timeout():
	var squake = squake_scene.instantiate()
	
	var squake_spawn_location = get_node("SquakePath/SquakeSpawnLocation")
	squake_spawn_location.progress_ratio = randf()
	
	var direction = squake_spawn_location.rotation + PI/2
	
	squake.position = squake_spawn_location.position
	
	direction += randf_range(-PI/4, PI/4)
	squake.rotation = direction
	
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	squake.linear_velocity = velocity.rotated(direction)
	
	add_child(squake)

func _on_start_timer_timeout():
	pass # Replace with function body.

func game_over():
	$SquakeTimer.stop()
	
func new_game():
	score = 0
	$Sheriff.start($StartPosition.position)
