extends KinematicBody2D

onready var view : = get_viewport_rect()
var velocity
var speed : float = 300.0

func _physics_process(delta):
	var direction = Vector2.ZERO
	velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		direction.x = 1	
	elif Input.is_action_pressed("ui_left"):
		direction.x = -1
	if Input.is_action_pressed("ui_down"):
		direction.y = 1
	elif Input.is_action_pressed("ui_up"):
		direction.y = -1
		
	velocity = direction.normalized() * speed
	position.x = clamp(position.x + velocity.x  * delta, 0, view.size.x)
	position.y = clamp(position.y + velocity.y * delta, 0, view.size.y)
