extends KinematicBody2D

onready var view : = get_viewport_rect()
onready var animated_sprite = $AnimatedSprite
onready var jump_timer = $JumpTimer
onready var collision_shape = $CollisionShape2D

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
		
	if (Input.is_action_pressed("ui_accept")):
		jump()
		
	velocity = direction.normalized() * speed
	position.x = clamp(position.x + velocity.x  * delta, 0, view.size.x)
	position.y = clamp(position.y + velocity.y * delta, 0, view.size.y)
	
func jump():
	animated_sprite.scale.x = 0.2
	animated_sprite.scale.y = 0.2
	collision_shape.disabled = true
	jump_timer.start()

func _on_JumpTimer_timeout():
	animated_sprite.scale.x = 0.15
	animated_sprite.scale.y = 0.15
	collision_shape.disabled = false
