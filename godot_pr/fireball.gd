extends Area2D

const speed =600
var velocity = Vector2()
var direction = 1

func _ready():
	pass 
	
func _set_fireball_direction(dir):
	direction = dir
	if dir ==-1:
		$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.flip_h = true
		
	
func _physics_process(delta):
	velocity.x = speed*delta*direction
	translate(velocity)	
	$AnimatedSprite.play("fire")


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_fireball_body_entered(body):
	if "enemies" in body.name:
		body.dead()
	queue_free()
