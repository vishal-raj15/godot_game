<<<<<<< HEAD
extends KinematicBody2D
const max_speed = 200
const gravity = 20
const jump_limit = 600
const acc = 50

=======
>>>>>>> 9a4fcf2041116b369bcf2962bbe8ec9a3fb01f19
const UP = Vector2(0,-1)   #now right and up can be pressed at same time acts like a vector triangle
var motion = Vector2()

func _physics_process(delta):
	motion.y += gravity
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x + acc , max_speed) 
		$Sprite.flip_h = true
		$Sprite.play("run")
		
		
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x - acc , -max_speed)
		$Sprite.flip_h = false
		$Sprite.play("run")
		
<<<<<<< HEAD
	elif Input.is_action_pressed("ui_down"):
		if is_on_floor():
			$Sprite.play("idle")
			
		else:
			
			motion.y= jump_limit
			$Sprite.flip_h = true
			$Sprite.play("fall")
			motion.x= lerp(motion.x , 0 , 0.05)
		
	else:
		
=======
	else:
		
>>>>>>> 9a4fcf2041116b369bcf2962bbe8ec9a3fb01f19
		$Sprite.play("idle")
		motion.x= lerp(motion.x , 0 , 0.2)  # adds friction after releasing running button
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = -jump_limit
			
	else:
		if motion.y <0:
			$Sprite.play("jump")			# here jump and falling animation works at only single animated sprite
<<<<<<< HEAD
		
		else:
			$Sprite.play("fall")            # here jump and falling animation works at only single animated sprite
			motion.x= lerp(motion.x , 0 , 0.05)
		
	motion = move_and_slide(motion,UP)
	pass
	
 

=======
		
		else:
			$Sprite.play("fall")            # here jump and falling animation works at only single animated sprite
			motion.x= lerp(motion.x , 0 , 0.05)
		
	motion = move_and_slide(motion,UP)
	pass
	
>>>>>>> 9a4fcf2041116b369bcf2962bbe8ec9a3fb01f19
