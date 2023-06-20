extends RigidBody2D

@export var count = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("crawl")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	
func damage(damage_object):
	print(damage_object)
	queue_free()

