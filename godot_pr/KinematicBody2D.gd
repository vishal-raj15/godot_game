extends KinematicBody2D
const speed = 150
const gravity = 20
const jump_limit = 400
var motion = Vector2()

func _physics_process(delta):
	motion.y += gravity
	if Input.is_action_pressed("ui_right"):
		motion.x = speed
		$Sprite.flip_h = true
		$Sprite.play("run")
		
		
	elif Input.is_action_pressed("ui_left"):
		motion.x = -speed
		$Sprite.flip_h = false
		$Sprite.play("run")
		
		
	elif Input.is_action_pressed("ui_up"):
		motion.y = -jump_limit
		$Sprite.play("jump")
		
		
	else:
		motion.x=0
		$Sprite.play("idle")	
		
	motion = move_and_slide(motion)
	pass
	
 
