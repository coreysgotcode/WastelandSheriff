extends RigidBody2D

@export var count = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("crawl")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_visible_on_screen_notifier_2d_screen_exited():
	print("Leaving")
	queue_free()
	
func damage():
	print("Ouch")
	queue_free()

