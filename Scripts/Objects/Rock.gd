extends Area2D

export var minSpeed : float = 50
export var maxSpeed : float = 80

var speed : float = 0.0

func _ready():
	speed = rand_range(minSpeed, maxSpeed)

func _physics_process(delta):
	self.position.y += speed * delta
