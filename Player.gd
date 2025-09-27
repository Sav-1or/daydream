extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const SPEED = 200
const JUMP_HEIGHT = 400
var motion = Vector2()

func _physics_process(delta):
	motion.y += GRAVITY
	
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("Run")
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("Run")
	else:
		motion.x = 0
		$AnimatedSprite.play("Idle")
	
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = -JUMP_HEIGHT
			$AnimatedSprite.play("Jump")
	
	motion = move_and_slide(motion, UP)


func _on_Enemy_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	get_tree().change_scene("res://level 2.tscn")

func _on_Enemy2_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	get_tree().change_scene("res://level 2.win")

	pass # Replace with function body.
