extends Area2D

export var minSpeed : float = 50
export var maxSpeed : float = 80

var speed : float = 0.0
var xPosition : float = 0.0
var counter : float = 0.0

func _ready():
	speed = rand_range(minSpeed, maxSpeed)

func _physics_process(delta):
	self.position.y += speed * delta
	self.position.x -= speed * delta

	
func _on_Rock_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	pass
