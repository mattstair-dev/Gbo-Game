extends KinematicBody2D

onready var animationPlayer = $AnimationPlayer

var velocity = Vector2.ZERO
var speed = 100
var last_pressed = 1
var points = 0

func _physics_process(delta):
	get_input()
	if velocity.x > 0:
		animationPlayer.play("Move_Right")
	elif velocity.x < 0:
		animationPlayer.play("Move_Left")
	elif velocity.y > 0:
		animationPlayer.play("Move_Down")
	elif velocity.y < 0:
		animationPlayer.play("Move_Up")
	elif last_pressed == 1 and velocity.x == 0:
		animationPlayer.play("Idle_Right")
	elif last_pressed == 2 and velocity.x == 0:
		animationPlayer.play("Idle_Left")
	elif last_pressed == 3 and velocity.x == 0:
		animationPlayer.play("Move_Down")
	elif last_pressed == 4 and velocity.x == 0:
		animationPlayer.play("Move_Up")
	
		
	velocity = move_and_slide(velocity)
	
	
func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
		last_pressed = 1
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
		last_pressed = 2
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
		last_pressed = 3
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
		last_pressed = 4
	velocity = velocity.normalized() * speed
