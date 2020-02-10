extends Area2D

const speed =200
var velocity = Vector2()

func _ready():
	pass 
	
func _physics_process(delta):
	velocity.x = speed*delta
	translate(velocity)	
	$AnimatedSprite.play("fire")


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
