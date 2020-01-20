extends KinematicBody2D
const speed = 150
const gravity = 20
const jump_limit = 500

const UP = Vector2(0,-1)   #now right and up can be pressed at same time acts like a vector triangle
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
		
	else:
		motion.x=0
		$Sprite.play("idle")
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = -jump_limit
			
		
	else:
		$Sprite.play("jump")
		
	motion = move_and_slide(motion,UP)
	pass
	
