extends KinematicBody2D

const g = 10
const speed = 150
const Floor = Vector2(0,-1)

var velocity = Vector2()
var direction = 1
var is_dead = false

func _ready():
	pass

func dead():
	is_dead = true
	velocity = Vector2(0,0)
	$AnimatedSprite.play("d1")
	$CollisionShape2D.disabled =true
	$Timer.start()
	

func _physics_process(delta):
	if is_dead == false:
		velocity.x = speed * direction
		
		if direction == 1:
			$AnimatedSprite.flip_h = false
		
		else:
			$AnimatedSprite.flip_h = true
			
		$AnimatedSprite.play("enemies")
		velocity.y += g
		velocity = move_and_slide(velocity , Floor)
	
	
	if is_on_wall():
		direction = direction * -1
		$RayCast2D.position.x *= -1
		
	if $RayCast2D.is_colliding() == false:
		direction = direction*-1
		$RayCast2D.position.x *= -1
		
func _on_Timer_timeout():
	queue_free()
