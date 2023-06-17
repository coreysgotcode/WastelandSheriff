extends RigidBody2D

signal hit
signal leaving

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("crawl")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_visible_on_screen_notifier_2d_screen_exited():
	leaving.emit()
	queue_free()
	

func _on_body_entered(body):
	
	hide() 
	hit.emit()
	#$CollisionShape2D.set_deferred("disabled", true)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
